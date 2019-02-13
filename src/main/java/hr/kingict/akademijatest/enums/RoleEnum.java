package hr.kingict.akademijatest.enums;

import org.springframework.security.core.authority.SimpleGrantedAuthority;

public enum RoleEnum {

    USER        ("USER"),
    ADMIN       ("ADMIN");

    private String code;

    RoleEnum(String code) {
        this.code = code;
    }

    public String getCode() {
        return code;
    }

    public SimpleGrantedAuthority getAuthority(){
        return new SimpleGrantedAuthority("ROLE_" + code);
    }
}
