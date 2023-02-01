package com.dong.cacheserver.mycache;

public class UserService {

    private CacheManger<User> cacheManger;

    public UserService() {
        cacheManger = new CacheManger<>();
    }

    public User getUserById(String userId) {
        User result = cacheManger.getValue(userId);

        if (result != null) {
            System.out.println("get from cache..." + userId);

            return result;
        }

        result = getFromDB(userId);
        if (result != null) {
            cacheManger.addOrUpdateCache(userId, result);
        }

        return result;
    }


    public void reload() {
        cacheManger.evictCache();
    }

    private User getFromDB(String userId) {

        System.out.println("real querying db..." + userId);

        return new User(userId);
    }

}
