<template>
  <q-page class="flex justify-start items-center column q-py-xl">
    <img
      alt="Quasar logo"
      src="~assets/plum.png"
      class="image"
      width="100px"
      height="120px"
    />
    <h3 class="title q-mt-sm">Plum</h3>
    <q-input
      class="app-input"
      rounded
      outlined
      v-model="searchText"
      placeholder="Begin Typing to Search"
      @keydown="search($event)"
    >
      <template v-slot:append>
        <q-icon name="close" @click="reset()" class="cursor-pointer" />
      </template>
    </q-input>
    <div v-if="working" class="flex-center q-mt-lg">
      <q-spinner-dots color="$primary" size="2rem" />
    </div>
    <div v-if="!working" class="list-container flex-center">
      <div v-if="locationsList.length === 0 && dirty">No results</div>
      <div v-else-if="locationsList.length === 0 && !dirty">
        Search for places from all around the world!
      </div>
      <locations-list v-else :listItems="locationsList" />
    </div>
  </q-page>
</template>
<script>
import axios from "axios";
import _ from "lodash";

import LocationsList from "@/components/LocationsList.vue";

export default {
  name: "PageIndex",
  components: {
    "locations-list": LocationsList
  },
  data: () => ({
    searchText: "",
    apiUrl: "https://mock-autocomplete.herokuapp.com/autocomplete?q=",
    locationsList: [],
    working: false,
    dirty: false,
    ignoredKeycodes: [91, 16]
  }),
  methods: {
    search(event) {
      console.log("E", event.keyCode);
      if (this.ignoredKeycodes.includes(event.keyCode)) {
        return;
      }
      this.working = true;
      this.debouncedSearch();
    },
    debouncedSearch: _.debounce(async function() {
      try {
        const result = await axios.get(`${this.apiUrl}${this.searchText}`);
        this.working = false;
        this.dirty = true;
        this.locationsList = result.data.data;
      } catch (error) {
        throw new Error(error);
      }
    }, 500),
    reset() {
      this.searchText = "";
      this.dirty = false;
      this.locationsList = [];
    }
  }
};
</script>
<style lang="stylus" scoped>
.image
    margin-left: 20px;
.title
    font-family: 'Patrick Hand SC'
    font-size: 4rem
.app-input
    width: 50%
.list-container
    display: flex
    min-width: 50%
</style>
