module.exports = {
  description: 'Create an ERC20 Token in less than a minute with the most used Smart Contract Generator for ERC20 Token. No login. No setup. No coding required.',
  base: '/erc20-generator/',
  head: [
    ['link', { rel: 'shortcut icon', href: '/favicon.ico' }],
    ['meta', { name: 'viewport', content: 'width=device-width, initial-scale=1, user-scalable=no' }],
    ['meta', { property: 'og:type', content: 'website' }],
    ['meta', { property: 'og:url', content: 'https://tokeniac.github.io/erc20-generator' }],
    ['meta', { property: 'og:image', content: 'https://tokeniac.github.io/erc20-generator/assets/images/erc20-token-generator.png' }], // eslint-disable-line max-len
    ['meta', { property: 'twitter:card', content: 'summary_large_image' }],
    ['meta', { property: 'twitter:image', content: 'https://tokeniac.github.io/erc20-generator/assets/images/erc20-token-generator.png' }], // eslint-disable-line max-len
    ['meta', { property: 'twitter:title', content: 'ERC20 Token Generator | Create ERC20 Token for FREE' }],
    ['script', { src: '/assets/js/web3.min.js' }],
    ['script',
      {
        src: 'https://cdn.jsdelivr.net/npm/cookie-bar/cookiebar-latest.min.js?forceLang=en&theme=momh&thirdparty=1&always=1&noGeoIp=1&scrolling=1&hideDetailsBtn=1', // eslint-disable-line max-len
        defer: true,
      },
    ],
  ],
  plugins: [
    [
      '@vuepress/google-analytics',
      {
        ga: 'UA-197024174-3',
      },
    ],
  ],
  defaultNetwork: 'mainnet',
  infuraProjectId: '21595bdef1fe47849b52d5e5ffdef016',
  etherscanApiKey: '5EKRJ6HV9VD8FHUB3NYDXVCR7JMV81RDU9',
};
