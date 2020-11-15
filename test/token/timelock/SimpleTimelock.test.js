const { BN, expectRevert, time } = require('@openzeppelin/test-helpers');

const { expect } = require('chai');

const { shouldBehaveLikeGeneratorCopyright } = require('../../utils/GeneratorCopyright.behaviour');

const ERC20Mock = artifacts.require('ERC20Mock');

const SimpleTimelock = artifacts.require('SimpleTimelock');
const ServiceReceiver = artifacts.require('ServiceReceiver');

contract('SimpleTimelock', function ([ owner, beneficiary ]) {
  const name = 'TEST';
  const symbol = 'TEST';

  const amount = new BN(100);

  const fee = 0;

  const version = 'v4.1.0';

  beforeEach(async function () {
    this.serviceReceiver = await ServiceReceiver.new({ from: owner });
    // not to set any price means it doesn't require any fee
    // await this.serviceReceiver.setPrice('SimpleERC20', fee);
  });

  context('with token', function () {
    beforeEach(async function () {
      this.token = await ERC20Mock.new(name, symbol, owner, amount, { from: owner });
    });

    it('rejects a release time in the past', async function () {
      const pastReleaseTime = (await time.latest()).sub(time.duration.years(1));
      await expectRevert(
        SimpleTimelock.new(
          this.token.address,
          beneficiary,
          pastReleaseTime,
          this.serviceReceiver.address,
          {
            from: owner,
            value: fee,
          },
        ),
        'TokenTimelock: release time is before current time',
      );
    });

    context('once deployed', function () {
      beforeEach(async function () {
        this.releaseTime = (await time.latest()).add(time.duration.years(1));
        this.timelock = await SimpleTimelock.new(
          this.token.address,
          beneficiary,
          this.releaseTime,
          this.serviceReceiver.address,
          {
            from: owner,
            value: fee,
          },
        );

        await this.token.transfer(this.timelock.address, amount, { from: owner });
      });

      it('can get state', async function () {
        expect(await this.timelock.token()).to.equal(this.token.address);
        expect(await this.timelock.beneficiary()).to.equal(beneficiary);
        expect(await this.timelock.releaseTime()).to.be.bignumber.equal(this.releaseTime);
      });

      it('cannot be released before time limit', async function () {
        await expectRevert(this.timelock.release(), 'TokenTimelock: current time is before release time');
      });

      it('cannot be released just before time limit', async function () {
        await time.increaseTo(this.releaseTime.sub(time.duration.seconds(3)));
        await expectRevert(this.timelock.release(), 'TokenTimelock: current time is before release time');
      });

      it('can be released just after limit', async function () {
        await time.increaseTo(this.releaseTime.add(time.duration.seconds(1)));
        await this.timelock.release();
        expect(await this.token.balanceOf(beneficiary)).to.be.bignumber.equal(amount);
      });

      it('can be released after time limit', async function () {
        await time.increaseTo(this.releaseTime.add(time.duration.years(1)));
        await this.timelock.release();
        expect(await this.token.balanceOf(beneficiary)).to.be.bignumber.equal(amount);
      });

      it('cannot be released twice', async function () {
        await time.increaseTo(this.releaseTime.add(time.duration.years(1)));
        await this.timelock.release();
        await expectRevert(this.timelock.release(), 'TokenTimelock: no tokens to release');
        expect(await this.token.balanceOf(beneficiary)).to.be.bignumber.equal(amount);
      });

      context('like a GeneratorCopyright', function () {
        beforeEach(async function () {
          this.instance = this.timelock;
        });

        shouldBehaveLikeGeneratorCopyright(version);
      });
    });
  });
});
