﻿// <auto-generated />
using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.EntityFrameworkCore.Metadata;
using Microsoft.EntityFrameworkCore.Migrations;
using Microsoft.EntityFrameworkCore.Storage.ValueConversion;
using StoneWare.Data;

namespace StoneWare.Migrations
{
    [DbContext(typeof(StoneWareContext))]
    [Migration("20200220215254_ProductData")]
    partial class ProductData
    {
        protected override void BuildTargetModel(ModelBuilder modelBuilder)
        {
#pragma warning disable 612, 618
            modelBuilder
                .HasAnnotation("ProductVersion", "3.1.1")
                .HasAnnotation("Relational:MaxIdentifierLength", 128)
                .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

            modelBuilder.Entity("StoneWare.Models.Issue", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

                    b.Property<int>("OperatingSystemId")
                        .HasColumnType("int");

                    b.Property<string>("Problem")
                        .IsRequired()
                        .HasColumnType("nvarchar(1000)")
                        .HasMaxLength(1000);

                    b.Property<int>("ProductId")
                        .HasColumnType("int");

                    b.Property<string>("Resolution")
                        .HasColumnType("nvarchar(1000)")
                        .HasMaxLength(1000);

                    b.Property<int>("StatusId")
                        .HasColumnType("int");

                    b.Property<DateTime>("TimeCreated")
                        .HasColumnType("datetime");

                    b.Property<DateTime>("TimeLastUpdated")
                        .HasColumnType("datetime");

                    b.Property<int>("VersionNumberId")
                        .HasColumnType("int");

                    b.HasKey("Id");

                    b.HasIndex("StatusId");

                    b.HasIndex("ProductId", "OperatingSystemId", "VersionNumberId");

                    b.ToTable("Issue");
                });

            modelBuilder.Entity("StoneWare.Models.OperatingSystem", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

                    b.Property<string>("Name")
                        .IsRequired()
                        .HasColumnType("nvarchar(20)")
                        .HasMaxLength(20);

                    b.HasKey("Id");

                    b.ToTable("OperatingSystem");
                });

            modelBuilder.Entity("StoneWare.Models.Product", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

                    b.Property<string>("Name")
                        .IsRequired()
                        .HasColumnType("nvarchar(40)")
                        .HasMaxLength(40);

                    b.HasKey("Id");

                    b.ToTable("Product");

                    b.HasData(
                        new
                        {
                            Id = 1,
                            Name = "Day Trader Wannabe"
                        },
                        new
                        {
                            Id = 2,
                            Name = "Investment Overlord"
                        },
                        new
                        {
                            Id = 3,
                            Name = "Workout Planner"
                        },
                        new
                        {
                            Id = 4,
                            Name = "Social Anxiety Planner"
                        });
                });

            modelBuilder.Entity("StoneWare.Models.ProductVersionOs", b =>
                {
                    b.Property<int>("ProductId")
                        .HasColumnType("int");

                    b.Property<int>("OperatingSystemId")
                        .HasColumnType("int");

                    b.Property<int>("VersionNumberId")
                        .HasColumnType("int");

                    b.HasKey("ProductId", "OperatingSystemId", "VersionNumberId");

                    b.HasIndex("OperatingSystemId");

                    b.HasIndex("VersionNumberId");

                    b.ToTable("ProductVersionOs");
                });

            modelBuilder.Entity("StoneWare.Models.Status", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

                    b.Property<string>("Name")
                        .IsRequired()
                        .HasColumnType("nvarchar(20)")
                        .HasMaxLength(20);

                    b.HasKey("Id");

                    b.ToTable("Status");

                    b.HasData(
                        new
                        {
                            Id = 1,
                            Name = "Outstanding"
                        },
                        new
                        {
                            Id = 2,
                            Name = "Resolved"
                        });
                });

            modelBuilder.Entity("StoneWare.Models.VersionNumber", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

                    b.Property<string>("Description")
                        .IsRequired()
                        .HasColumnType("nvarchar(10)")
                        .HasMaxLength(10);

                    b.HasKey("Id");

                    b.ToTable("VersionNumber");
                });

            modelBuilder.Entity("StoneWare.Models.Issue", b =>
                {
                    b.HasOne("StoneWare.Models.Status", "Status")
                        .WithMany("Issue")
                        .HasForeignKey("StatusId")
                        .HasConstraintName("FK_Issue_Status")
                        .IsRequired();

                    b.HasOne("StoneWare.Models.ProductVersionOs", "ProductVersionOs")
                        .WithMany("Issue")
                        .HasForeignKey("ProductId", "OperatingSystemId", "VersionNumberId")
                        .HasConstraintName("FK_Issue_ProductVersionOs")
                        .IsRequired();
                });

            modelBuilder.Entity("StoneWare.Models.ProductVersionOs", b =>
                {
                    b.HasOne("StoneWare.Models.OperatingSystem", "OperatingSystem")
                        .WithMany("ProductVersionOs")
                        .HasForeignKey("OperatingSystemId")
                        .HasConstraintName("FK_ProductVersionOs_OperatingSystem")
                        .IsRequired();

                    b.HasOne("StoneWare.Models.Product", "Product")
                        .WithMany("ProductVersionOs")
                        .HasForeignKey("ProductId")
                        .HasConstraintName("FK_ProductVersionOs_Product")
                        .IsRequired();

                    b.HasOne("StoneWare.Models.VersionNumber", "VersionNumber")
                        .WithMany("ProductVersionOs")
                        .HasForeignKey("VersionNumberId")
                        .HasConstraintName("FK_ProductVersionOs_VersionNumber")
                        .IsRequired();
                });
#pragma warning restore 612, 618
        }
    }
}
