package com.winning.hic.model;

/**
 * Created with IntelliJ IDEA.
 * Description:
 * User: LENOVO
 * Date: 2018-07-24
 * Time: 14:53
 */
public class Environment {

    public static final String DRIVE_CLASS_NAME ="com.microsoft.sqlserver.jdbc.SQLServerDriver";
    private String db1Url;
    private String db1Username;
    private String db1Password;
    private String db2Url;
    private String db2Username;
    private String db2Password;

    public String getDb1Url() {
        return db1Url;
    }

    public void setDb1Url(String db1Url) {
        this.db1Url = db1Url;
    }

    public String getDb1Username() {
        return db1Username;
    }

    public void setDb1Username(String db1Username) {
        this.db1Username = db1Username;
    }

    public String getDb1Password() {
        return db1Password;
    }

    public void setDb1Password(String db1Password) {
        this.db1Password = db1Password;
    }

    public String getDb2Url() {
        return db2Url;
    }

    public void setDb2Url(String db2Url) {
        this.db2Url = db2Url;
    }

    public String getDb2Username() {
        return db2Username;
    }

    public void setDb2Username(String db2Username) {
        this.db2Username = db2Username;
    }

    public String getDb2Password() {
        return db2Password;
    }

    public void setDb2Password(String db2Password) {
        this.db2Password = db2Password;
    }
}
