<template>
  <q-layout view="lHh Lpr lFf">
    <q-header elevated>
      <q-toolbar class="$primary">
        <q-btn
          flat
          dense
          round
          @click="leftDrawerOpen = !leftDrawerOpen"
          aria-label="Menu"
        >
          <q-icon name="menu" />
          <q-menu
            :offset="[0, 15]"
            transition-show="flip-right"
            transition-hide="flip-left"
          >
            <q-list style="min-width: 100px">
              <q-item clickable>
                <q-item-section>Nice!!!</q-item-section>
              </q-item>
              <q-item clickable>
                <q-item-section>Free Ice Cream!!</q-item-section>
              </q-item>
              <q-separator />
              <q-item clickable>
                <q-item-section>Mind blown!!!!</q-item-section>
              </q-item>
            </q-list>
          </q-menu>
        </q-btn>

        <q-toolbar-title class="text-secondary logo-title">
          PLUM
        </q-toolbar-title>

        <div>Jossendal Development</div>
      </q-toolbar>
    </q-header>

    <q-page-container>
      <router-view />
    </q-page-container>
  </q-layout>
</template>

<script>
export default {
  name: "MyLayout"
};
</script>

<style lang="stylus" scoped>
.logo-title
    font-family: 'Patrick Hand SC'
    font-size: 24px
    font-weight: bold
</style>
