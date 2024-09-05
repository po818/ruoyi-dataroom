<template>
<iframe id="bigscreen" class="bigscreen" :src=src />
</template>
<script>
    export default {
        data() {
            return {
                src: null
            }
        },
        created() {
            this.src = window.location.origin + '/#/big-screen-list'
        }
    }
</script>
<style lang="scss" scoped>
.bigscreen {
  width: 100%;
  height: calc(100vh - 88px);
}
</style>

