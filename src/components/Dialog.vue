<template>
  <div class="q-pa-md q-gutter-sm">
    <q-dialog v-model="open" transition-show="rotate" transition-hide="rotate">
      <q-card style="width: 300px">
        <q-card-section>
          <div class="text-h6">
            {{ selectedCountry.name.common || "unknown" }}
          </div>
        </q-card-section>

        <q-card-section>
          <p>Capital:</p>
          <p>{{ selectedCountry.capital || "unknown" }}</p>
        </q-card-section>

        <q-card-section>
          <p>Currencies:</p>
          <p v-for="currency in selectedCountry.currency" :key="currency">
            {{ currency }}
          </p>
        </q-card-section>

        <q-card-section>
          <p>Languages:</p>
          <p v-for="lang in selectedCountry.languages" :key="lang">
            {{ lang }}
          </p>
        </q-card-section>

        <q-card-actions align="right">
          <q-btn flat label="OK" color="primary" v-close-popup />
        </q-card-actions>
      </q-card>
    </q-dialog>
  </div>
</template>
<script>
import Country from "@/types/Country";

export default {
  props: {
    selectedCountry: {
      type: Object,
      required: false,
      default: () => {
        return new Country();
      }
    }
  },
  data: () => ({
    open: false
  }),
  methods: {
    openModal() {
      this.open = true;
    }
  }
};
</script>
