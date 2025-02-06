package com.spike.security;

import java.util.Collection;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.User;
import com.spike.dto.UserDTO;

public class SpikeUser extends User {

    private UserDTO user;

    public SpikeUser(UserDTO user, String username, String password, Collection<? extends GrantedAuthority> authorities) {
        super(username, password, authorities);
        this.user = user;
    }

    public UserDTO getUser() {
        return user;
    }
}
