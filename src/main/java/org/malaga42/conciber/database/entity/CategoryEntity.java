package org.malaga42.conciber.database.entity;

import jakarta.persistence.*;

import java.util.Objects;

@Entity
@Table(name = "category", schema = "conCiber", catalog = "")
public class CategoryEntity {
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id
    @Column(name = "category_id")
    private int categoryId;
    @Basic
    @Column(name = "name")
    private String name;
    @ManyToOne
    @JoinColumn(name = "entry_id", referencedColumnName = "id", nullable = false)
    private EntryEntity entryByEntryId;

    public int getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        CategoryEntity that = (CategoryEntity) o;
        return categoryId == that.categoryId && Objects.equals(name, that.name);
    }

    @Override
    public int hashCode() {
        return Objects.hash(categoryId, name);
    }

    public EntryEntity getEntryByEntryId() {
        return entryByEntryId;
    }

    public void setEntryByEntryId(EntryEntity entryByEntryId) {
        this.entryByEntryId = entryByEntryId;
    }
}
