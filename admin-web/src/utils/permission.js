import store from '@/store'

/**
 * 校验角色
 * @param {Array} value
 * @returns {Boolean}
 * @example see @/views/permission/directive.vue
 */
export function checkRole(value) {
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

/**
 * 校验权限
 * @param {Array} value
 * @returns {Boolean}
 * @example see @/views/permission/directive.vue
 */
export function checkPermission(value) {
  debugger
  if (value && value instanceof Array && value.length > 0) {
    const ownedPermissions = store.getters && store.getters.permissions
    return value.some(permission => {
      return ownedPermissions.includes('VIEW_' + permission)
    })
  } else {
    console.error(`无角色权限`)
    return false
  }
}
