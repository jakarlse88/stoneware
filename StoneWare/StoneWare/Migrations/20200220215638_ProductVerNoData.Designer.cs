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
    [Migration("20200220215638_ProductVerNoData")]
    partial class ProductVerNoData
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

                    b.HasData(
                        new
                        {
                            Id = 1,
                            Name = "Linux"
                        },
                        new
                        {
                            Id = 2,
                            Name = "MacOS"
                        },
                        new
                        {
                            Id = 3,
                            Name = "Windows"
                        },
                        new
                        {
                            Id = 4,
                            Name = "Android"
                        },
                        new
                        {
                            Id = 5,
                            Name = "iOS"
                        },
                        new
                        {
                            Id = 6,
                            Name = "Windows Mobile"
                        });
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

                    b.HasData(
                        new
                        {
                            ProductId = 1,
                            OperatingSystemId = 1,
                            VersionNumberId = 1
                        },
                        new
                        {
                            ProductId = 1,
                            OperatingSystemId = 3,
                            VersionNumberId = 1
                        },
                        new
                        {
                            ProductId = 1,
                            OperatingSystemId = 1,
                            VersionNumberId = 2
                        },
                        new
                        {
                            ProductId = 1,
                            OperatingSystemId = 2,
                            VersionNumberId = 2
                        },
                        new
                        {
                            ProductId = 1,
                            OperatingSystemId = 3,
                            VersionNumberId = 2
                        },
                        new
                        {
                            ProductId = 1,
                            OperatingSystemId = 1,
                            VersionNumberId = 3
                        },
                        new
                        {
                            ProductId = 1,
                            OperatingSystemId = 2,
                            VersionNumberId = 3
                        },
                        new
                        {
                            ProductId = 1,
                            OperatingSystemId = 3,
                            VersionNumberId = 3
                        },
                        new
                        {
                            ProductId = 1,
                            OperatingSystemId = 4,
                            VersionNumberId = 3
                        },
                        new
                        {
                            ProductId = 1,
                            OperatingSystemId = 5,
                            VersionNumberId = 3
                        },
                        new
                        {
                            ProductId = 1,
                            OperatingSystemId = 6,
                            VersionNumberId = 3
                        },
                        new
                        {
                            ProductId = 1,
                            OperatingSystemId = 2,
                            VersionNumberId = 4
                        },
                        new
                        {
                            ProductId = 1,
                            OperatingSystemId = 3,
                            VersionNumberId = 4
                        },
                        new
                        {
                            ProductId = 1,
                            OperatingSystemId = 4,
                            VersionNumberId = 4
                        },
                        new
                        {
                            ProductId = 1,
                            OperatingSystemId = 5,
                            VersionNumberId = 4
                        },
                        new
                        {
                            ProductId = 2,
                            OperatingSystemId = 2,
                            VersionNumberId = 1
                        },
                        new
                        {
                            ProductId = 2,
                            OperatingSystemId = 5,
                            VersionNumberId = 1
                        },
                        new
                        {
                            ProductId = 2,
                            OperatingSystemId = 2,
                            VersionNumberId = 5
                        },
                        new
                        {
                            ProductId = 2,
                            OperatingSystemId = 4,
                            VersionNumberId = 5
                        },
                        new
                        {
                            ProductId = 2,
                            OperatingSystemId = 5,
                            VersionNumberId = 5
                        },
                        new
                        {
                            ProductId = 2,
                            OperatingSystemId = 2,
                            VersionNumberId = 6
                        },
                        new
                        {
                            ProductId = 2,
                            OperatingSystemId = 3,
                            VersionNumberId = 6
                        },
                        new
                        {
                            ProductId = 2,
                            OperatingSystemId = 4,
                            VersionNumberId = 6
                        },
                        new
                        {
                            ProductId = 2,
                            OperatingSystemId = 5,
                            VersionNumberId = 6
                        },
                        new
                        {
                            ProductId = 3,
                            OperatingSystemId = 1,
                            VersionNumberId = 1
                        },
                        new
                        {
                            ProductId = 3,
                            OperatingSystemId = 2,
                            VersionNumberId = 1
                        },
                        new
                        {
                            ProductId = 3,
                            OperatingSystemId = 1,
                            VersionNumberId = 2
                        },
                        new
                        {
                            ProductId = 3,
                            OperatingSystemId = 2,
                            VersionNumberId = 2
                        },
                        new
                        {
                            ProductId = 3,
                            OperatingSystemId = 3,
                            VersionNumberId = 2
                        },
                        new
                        {
                            ProductId = 3,
                            OperatingSystemId = 4,
                            VersionNumberId = 2
                        },
                        new
                        {
                            ProductId = 3,
                            OperatingSystemId = 5,
                            VersionNumberId = 2
                        },
                        new
                        {
                            ProductId = 3,
                            OperatingSystemId = 6,
                            VersionNumberId = 2
                        },
                        new
                        {
                            ProductId = 3,
                            OperatingSystemId = 2,
                            VersionNumberId = 5
                        },
                        new
                        {
                            ProductId = 3,
                            OperatingSystemId = 3,
                            VersionNumberId = 5
                        },
                        new
                        {
                            ProductId = 3,
                            OperatingSystemId = 4,
                            VersionNumberId = 5
                        },
                        new
                        {
                            ProductId = 3,
                            OperatingSystemId = 5,
                            VersionNumberId = 5
                        },
                        new
                        {
                            ProductId = 4,
                            OperatingSystemId = 2,
                            VersionNumberId = 1
                        },
                        new
                        {
                            ProductId = 4,
                            OperatingSystemId = 3,
                            VersionNumberId = 1
                        },
                        new
                        {
                            ProductId = 4,
                            OperatingSystemId = 4,
                            VersionNumberId = 1
                        },
                        new
                        {
                            ProductId = 4,
                            OperatingSystemId = 5,
                            VersionNumberId = 1
                        },
                        new
                        {
                            ProductId = 4,
                            OperatingSystemId = 6,
                            VersionNumberId = 1
                        },
                        new
                        {
                            ProductId = 4,
                            OperatingSystemId = 2,
                            VersionNumberId = 2
                        },
                        new
                        {
                            ProductId = 4,
                            OperatingSystemId = 3,
                            VersionNumberId = 2
                        },
                        new
                        {
                            ProductId = 4,
                            OperatingSystemId = 4,
                            VersionNumberId = 2
                        },
                        new
                        {
                            ProductId = 4,
                            OperatingSystemId = 5,
                            VersionNumberId = 2
                        });
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

                    b.HasData(
                        new
                        {
                            Id = 1,
                            Description = "1.0"
                        },
                        new
                        {
                            Id = 2,
                            Description = "1.1"
                        },
                        new
                        {
                            Id = 3,
                            Description = "1.2"
                        },
                        new
                        {
                            Id = 4,
                            Description = "1.3"
                        },
                        new
                        {
                            Id = 5,
                            Description = "2.0"
                        },
                        new
                        {
                            Id = 6,
                            Description = "2.1"
                        });
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
