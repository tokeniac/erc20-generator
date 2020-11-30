<template>
    <b-container fluid>
        <b-row id="token-docs">
            <b-col lg="10" offset-lg="1" class="mb-3 p-0">
                <b-card bg-variant="transparent" border-variant="0">
                    <b-row>
                        <b-col lg="12">
                            <b-card header="ERC20 Token Dashboard"
                                    header-bg-variant="info"
                                    header-text-variant="white"
                                    class="mt-3">
                                <ValidationObserver
                                        ref="observer"
                                        tag="form"
                                        @submit.prevent="loadAbi()">
                                    <ValidationProvider
                                            name="token name"
                                            :rules="{ required: true }"
                                            v-slot="{ errors }">
                                        <b-form-group
                                                label="Token Address *"
                                                label-for="tokenAddress">
                                            <b-form-input
                                                    id="tokenAddress"
                                                    name="tokenAddress"
                                                    placeholder="Your token address"
                                                    v-model.trim="token.address"
                                                    size="lg"
                                                    :class="{'is-invalid': errors.length > 0}"
                                                    maxlength="42">
                                            </b-form-input>
                                            <small v-show="errors.length > 0" class="text-danger">
                                                {{ errors[0] }}
                                            </small>
                                        </b-form-group>
                                        <b-button variant="success"
                                                  size="lg"
                                                  block
                                                  type="submit"
                                                  class="mt-3 py-3 px-5 text-uppercase">
                                            Search
                                        </b-button>
                                    </ValidationProvider>
                                </ValidationObserver>
                            </b-card>
                        </b-col>
                        <b-col lg="12">
                            <div v-if="loading" class="text-center p-5">
                                <ui--loader :loading="true"></ui--loader>
                            </div>
                        </b-col>
                        <b-col lg="12" v-if="!loading && token.stringifiedAbi !== ''">
                            <b-card bg-variant="light"
                                    header="Token ABI"
                                    header-bg-variant="info"
                                    header-text-variant="white"
                                    class="mt-3">
                                <div class="form-group">
                                    <label>ABI:</label>
                                    <b-form-textarea readonly
                                                     no-resize
                                                     rows="5"
                                                     v-model="token.stringifiedAbi">
                                    </b-form-textarea>
                                </div>
                            </b-card>
                        </b-col>
                    </b-row>
                </b-card>
            </b-col>
        </b-row>
        <b-row class="bg-light text-dark mx-0">
            <b-col lg="10" offset-lg="1" class="mb-3 text-center">
                <h2 class="pt-5 mb-4 font-weight-lighter text-dark">Ready to deploy your ERC20 Token?</h2>
                <p class="font-weight-light">
                    Try building your ERC20 Token in less than a minute. You can try on Test Network before to go live.
                </p>
                <b-button to="/create-token/" size="lg" variant="success" class="my-5 py-3 px-5 text-uppercase">
                    Create ERC20 Token
                </b-button>
            </b-col>
        </b-row>
    </b-container>
</template>

<script>
  import dapp from '../mixins/dapp';
  import etherscan from '../mixins/etherscan';

  export default {
    name: 'Dashboard',
    mixins: [
      dapp,
      etherscan,
    ],
    data () {
      return {
        loading: false,
        currentNetwork: null,
        token: {
          stringifiedAbi: '',
        },
      };
    },
    computed: {},
    mounted () {},
    methods: {
      async loadAbi () {
        this.$refs.observer.validate().then(async (result) => {
          if (result) {
            try {
              this.loading = true;

              this.token.stringifiedAbi = await this.getAbi(this.token.address);
            } catch (e) {
              this.makeToast(
                'Some error occurred',
                e.message,
                'danger',
              );
            }

            this.loading = false;
          }
        }).catch((e) => {
          console.log(e); // eslint-disable-line no-console
          this.loading = false;
          this.makeToast(
            'Some error occurred',
            e.message,
            'danger',
          );
        });
      },
    },
  };
</script>
