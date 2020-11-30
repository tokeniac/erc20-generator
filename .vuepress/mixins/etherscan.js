import axios from 'axios';

import config from '../config';
import utils from './utils';

export default {
  mixins: [
    utils,
  ],
  data () {
    return {
      apiUrl: `https://api.etherscan.io/api?apikey=${config.etherscanApiKey}`,
    };
  },
  methods: {
    async getAbi (address) {
      const response = await axios.get(`${this.apiUrl}&module=contract&action=getabi&address=${address}`);
      return response.data.result;
    },
  },
};
