package hr.kingict.akademijatest.mapper;

import hr.kingict.akademijatest.details.CustomLdapUserDetails;
import org.springframework.ldap.core.DirContextOperations;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.ldap.userdetails.LdapUserDetailsMapper;

import java.util.Collection;

public class CustomLdapUserDetailsMapper extends LdapUserDetailsMapper {

    @Override
    public UserDetails mapUserFromContext(DirContextOperations ctx, String username, Collection<? extends GrantedAuthority> authorities) {
        // TODO mapiraj AD korisnika na UserDetails objekt
        CustomLdapUserDetails userDetails = new CustomLdapUserDetails();

        return super.mapUserFromContext(ctx, username, authorities);
    }
}
