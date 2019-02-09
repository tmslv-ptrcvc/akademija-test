package hr.kingict.akademijatest.service.impl;

import hr.kingict.akademijatest.details.CustomUserDetails;
import hr.kingict.akademijatest.entity.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

@Service
public class UserDetailsServiceImpl implements UserDetailsService {

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        // TODO dohvati korisnika iz baze
        User user = new User();
        user.setId(124L);
        user.setUsername("user");
        user.setPassword("$2a$04$ldhIu0qw5niMIjxt2BJveO9V.7SCBlm89uxQ.OFj6qFqioYJkrWUO");

        // TODO dohvati role iz baze

        return new CustomUserDetails(user, "USER");
    }
}
