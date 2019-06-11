<template>
    <q-list dense bordered padding class="rounded-borders">
      <q-item clickable v-ripple v-for="(item, i) in listItems" :key="item + i">
        <q-item-section>
          {{ item }}
        </q-item-section>
      </q-item>
    </q-list>
</template>
<script>
export default {
    props: {
        listItems: {
            type: Array,
            required: true
        }
    }    
}
</script>
    