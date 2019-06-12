<template>
  <div style="width:100%; margin: 0 auto;">
    <q-list bordered padding class="rounded-borders app-list q-mt-xl">
      <q-item
        clickable
        v-ripple
        v-for="(item, i) in listItems"
        :key="item + i"
        @click="getCountryDetails(item)"
      >
        <q-item-section>
          {{ item }}
        </q-item-section>
      </q-item>
    </q-list>
    <app-dialog ref="appdialog" :selectedCountry="selectedCountry" />
  </div>
</template>
<script>
import Countries from "countries-api";

import Dialog from "@/components/Dialog.vue";
import Country from "@/types/Country";

export default {
  components: {
    "app-dialog": Dialog
  },
  props: {
    listItems: {
      type: Array,
      required: true
    }
  },
  data: () => ({
    selectedCountry: {
      name: ""
    }
  }),
  methods: {
    async getCountryDetails(name) {
      try {
        const co = await Countries.findByName(name);
        console.log("CO", co);
        if (co.statusCode === 404) {
          this.selectedCountry = new Country();
          return;
        } else {
          this.selectedCountry = co.data[0];
          this.$refs.appdialog.openModal();
        }
      } catch (error) {
        throw new Error(error);
      }
    }
  }
};
</script>
<style lang="stylus" scoped>
.app-list
    width: 100%
</style>
