<template>
<iframe class="dashboard" :src=src />
</template>
<script>
    export default {
        data() {
            return {
                src: null
            }
        },
        created() {
            this.src = window.location.origin + '/#/dashboard-list'
        }
    }
</script>
<style lang="scss" scoped>
.dashboard {
  width: 100%;
  height: calc(100vh - 88px);
}
</style>

