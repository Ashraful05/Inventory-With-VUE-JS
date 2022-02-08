<template>

</template>

<script>
export default {
    created() {
        localStorage.removeItem('token')
        localStorage.removeItem('user')

        Toast.fire({
            icon: 'success',
            title: 'Successfully Logout!!!'
        })
        this.$router.push({ name: '/' })
    },
    name: "LogOutComponent"
}
</script>

<style scoped>

</style>
