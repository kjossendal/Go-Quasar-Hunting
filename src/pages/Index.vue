<template>
  <q-page class="flex flex-center column">
    <img alt="Quasar logo" src="~assets/quasar-logo-full.svg" />
    <q-input outlined v-model="searchText" @keypress="search($event)" label="Search" />
    <locations-list :listItems="locationsList" />
  </q-page>
</template>

<style></style>

<script>
import axios from 'axios';
import _ from 'lodash'

import LocationsList from '@/components/LocationsList.vue';

export default {
    name: "PageIndex",
    components: {
        'locations-list': LocationsList
    },
    data: () => ({
        searchText: '',
        apiUrl: 'https://mock-autocomplete.herokuapp.com/autocomplete?q=',
        locationsList: []
    }),
    methods: {
        search: _.debounce(async function() {
            const result = await axios.get(`${this.apiUrl}${this.searchText}`);
            console.log("RESULT", result)
            this.locationsList = result.data.data;
        }, 1000),
    }
};
</script>
