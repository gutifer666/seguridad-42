package org.malaga42.conciber.database.entity;

import jakarta.persistence.*;

import java.sql.Timestamp;
import java.util.Collection;
import java.util.Objects;

@Entity
@Table(name = "user", schema = "conCiber", catalog = "")
public class UserEntity {
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id
    @Column(name = "id")
    private long id;
    @Basic
    @Column(name = "username")
    private String username;
    @Basic
    @Column(name = "email")
    private String email;
    @Basic
    @Column(name = "password")
    private String password;
    @Basic
    @Column(name = "create_time")
    private Timestamp createTime;
    @OneToMany(mappedBy = "userByUserId")
    private Collection<CommentsEntity> commentsById;
    @OneToMany(mappedBy = "userByUserId")
    private Collection<EntryEntity> entriesById;
    @ManyToOne
    @JoinColumn(name = "role_category_id", referencedColumnName = "category_id", nullable = false)
    private RoleEntity roleByRoleCategoryId;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Timestamp getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Timestamp createTime) {
        this.createTime = createTime;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        UserEntity that = (UserEntity) o;
        return id == that.id && Objects.equals(username, that.username) && Objects.equals(email, that.email) && Objects.equals(password, that.password) && Objects.equals(createTime, that.createTime);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, username, email, password, createTime);
    }

    public Collection<CommentsEntity> getCommentsById() {
        return commentsById;
    }

    public void setCommentsById(Collection<CommentsEntity> commentsById) {
        this.commentsById = commentsById;
    }

    public Collection<EntryEntity> getEntriesById() {
        return entriesById;
    }

    public void setEntriesById(Collection<EntryEntity> entriesById) {
        this.entriesById = entriesById;
    }

    public RoleEntity getRoleByRoleCategoryId() {
        return roleByRoleCategoryId;
    }

    public void setRoleByRoleCategoryId(RoleEntity roleByRoleCategoryId) {
        this.roleByRoleCategoryId = roleByRoleCategoryId;
    }
}
