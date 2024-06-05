import store from '@/store'

/**
 * @param {Array} value
 * @returns {Boolean}
 * @example see @/views/permission/directive.vue
 */
export default function checkRole(value) {
  if (value && value instanceof Array && value.length > 0) {
    const ownedRoles = store.getters && store.getters.roles
    const roles = value
    return ownedRoles.some(role => {
      return roles.includes(role)
    })
  } else {
    console.error(`无角色权限`)
    return false
  }
}
