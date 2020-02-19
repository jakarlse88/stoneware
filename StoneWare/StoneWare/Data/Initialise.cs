using System;
using System.Collections.Generic;
using System.Diagnostics.CodeAnalysis;
using Bogus;
using Microsoft.AspNetCore.Builder;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.DependencyInjection;
using StoneWare.Models;
using OperatingSystem = StoneWare.Models.OperatingSystem;
using System.Linq;

namespace StoneWare.Data
{
    public static class Initialise
    {
        public static void SeedDb(IApplicationBuilder app)
        {
            // ReSharper disable once ConvertToUsingDeclaration
            using (var serviceScope = app.ApplicationServices
                .GetRequiredService<IServiceScopeFactory>()
                .CreateScope())
            {
                using (var context = serviceScope.ServiceProvider.GetService<StoneWareContext>())
                {
                    context.Database.EnsureCreated();
                    
                    PopulateOperatingSystem(context);

                    PopulateVersionNumber(context);

                    PopulateProduct(context);

                    PopulateStatus(context);

                    PopulateProductVersionOs(context);

                    PopulateIssue(context);
                }
            }
        }

        private static void PopulateIssue(StoneWareContext context)
        {
            if (!context.Issue.Any())
            {
                var issues = GenerateTestIssues();

                context.Issue.AddRange(issues);

                context.Database.OpenConnection();

                context.Database.ExecuteSqlRaw("SET IDENTITY_INSERT dbo.Issue ON");

                context.SaveChanges();

                context.Database.ExecuteSqlRaw("SET IDENTITY_INSERT dbo.Issue OFF");

                context.Database.CloseConnection();
            }
        }

        private static void PopulateProductVersionOs(StoneWareContext context)
        {
            if (!context.ProductVersionOs.Any())
            {
                context.ProductVersionOs.AddRange(new ProductVersionOs
                    {
                        ProductId = (int) ProdEnum.DayTraderWannabe,
                        VersionNumberId = (int) VerNoEnum.OneZero,
                        OperatingSystemId = (int) OSEnum.Linux
                    },
                    new ProductVersionOs
                    {
                        ProductId = (int) ProdEnum.DayTraderWannabe,
                        VersionNumberId = (int) VerNoEnum.OneZero,
                        OperatingSystemId = (int) OSEnum.Windows
                    },
                    new ProductVersionOs
                    {
                        ProductId = (int) ProdEnum.DayTraderWannabe,
                        VersionNumberId = (int) VerNoEnum.OneOne,
                        OperatingSystemId = (int) OSEnum.Linux
                    },
                    new ProductVersionOs
                    {
                        ProductId = (int) ProdEnum.DayTraderWannabe,
                        VersionNumberId = (int) VerNoEnum.OneOne,
                        OperatingSystemId = (int) OSEnum.MacOS
                    },
                    new ProductVersionOs
                    {
                        ProductId = (int) ProdEnum.DayTraderWannabe,
                        VersionNumberId = (int) VerNoEnum.OneOne,
                        OperatingSystemId = (int) OSEnum.Windows
                    },
                    new ProductVersionOs
                    {
                        ProductId = (int) ProdEnum.DayTraderWannabe,
                        VersionNumberId = (int) VerNoEnum.OneTwo,
                        OperatingSystemId = (int) OSEnum.Linux
                    },
                    new ProductVersionOs
                    {
                        ProductId = (int) ProdEnum.DayTraderWannabe,
                        VersionNumberId = (int) VerNoEnum.OneTwo,
                        OperatingSystemId = (int) OSEnum.MacOS
                    },
                    new ProductVersionOs
                    {
                        ProductId = (int) ProdEnum.DayTraderWannabe,
                        VersionNumberId = (int) VerNoEnum.OneTwo,
                        OperatingSystemId = (int) OSEnum.Windows
                    },
                    new ProductVersionOs
                    {
                        ProductId = (int) ProdEnum.DayTraderWannabe,
                        VersionNumberId = (int) VerNoEnum.OneTwo,
                        OperatingSystemId = (int) OSEnum.Android
                    },
                    new ProductVersionOs
                    {
                        ProductId = (int) ProdEnum.DayTraderWannabe,
                        VersionNumberId = (int) VerNoEnum.OneTwo,
                        OperatingSystemId = (int) OSEnum.iOS
                    },
                    new ProductVersionOs
                    {
                        ProductId = (int) ProdEnum.DayTraderWannabe,
                        VersionNumberId = (int) VerNoEnum.OneTwo,
                        OperatingSystemId = (int) OSEnum.WindowsMobile
                    },
                    new ProductVersionOs
                    {
                        ProductId = (int) ProdEnum.DayTraderWannabe,
                        VersionNumberId = (int) VerNoEnum.OneThree,
                        OperatingSystemId = (int) OSEnum.MacOS
                    },
                    new ProductVersionOs
                    {
                        ProductId = (int) ProdEnum.DayTraderWannabe,
                        VersionNumberId = (int) VerNoEnum.OneThree,
                        OperatingSystemId = (int) OSEnum.Windows
                    },
                    new ProductVersionOs
                    {
                        ProductId = (int) ProdEnum.DayTraderWannabe,
                        VersionNumberId = (int) VerNoEnum.OneThree,
                        OperatingSystemId = (int) OSEnum.Android
                    },
                    new ProductVersionOs
                    {
                        ProductId = (int) ProdEnum.DayTraderWannabe,
                        VersionNumberId = (int) VerNoEnum.OneThree,
                        OperatingSystemId = (int) OSEnum.iOS
                    },
                    new ProductVersionOs
                    {
                        ProductId = (int) ProdEnum.InvestmentOverlord,
                        VersionNumberId = (int) VerNoEnum.OneZero,
                        OperatingSystemId = (int) OSEnum.MacOS
                    },
                    new ProductVersionOs
                    {
                        ProductId = (int) ProdEnum.InvestmentOverlord,
                        VersionNumberId = (int) VerNoEnum.OneZero,
                        OperatingSystemId = (int) OSEnum.iOS
                    },
                    new ProductVersionOs
                    {
                        ProductId = (int) ProdEnum.InvestmentOverlord,
                        VersionNumberId = (int) VerNoEnum.TwoZero,
                        OperatingSystemId = (int) OSEnum.MacOS
                    },
                    new ProductVersionOs
                    {
                        ProductId = (int) ProdEnum.InvestmentOverlord,
                        VersionNumberId = (int) VerNoEnum.TwoZero,
                        OperatingSystemId = (int) OSEnum.Android
                    },
                    new ProductVersionOs
                    {
                        ProductId = (int) ProdEnum.InvestmentOverlord,
                        VersionNumberId = (int) VerNoEnum.TwoZero,
                        OperatingSystemId = (int) OSEnum.iOS
                    },
                    new ProductVersionOs
                    {
                        ProductId = (int) ProdEnum.InvestmentOverlord,
                        VersionNumberId = (int) VerNoEnum.TwoOne,
                        OperatingSystemId = (int) OSEnum.MacOS
                    },
                    new ProductVersionOs
                    {
                        ProductId = (int) ProdEnum.InvestmentOverlord,
                        VersionNumberId = (int) VerNoEnum.TwoOne,
                        OperatingSystemId = (int) OSEnum.Windows
                    },
                    new ProductVersionOs
                    {
                        ProductId = (int) ProdEnum.InvestmentOverlord,
                        VersionNumberId = (int) VerNoEnum.TwoOne,
                        OperatingSystemId = (int) OSEnum.Android
                    },
                    new ProductVersionOs
                    {
                        ProductId = (int) ProdEnum.InvestmentOverlord,
                        VersionNumberId = (int) VerNoEnum.TwoOne,
                        OperatingSystemId = (int) OSEnum.iOS
                    },
                    new ProductVersionOs
                    {
                        ProductId = (int) ProdEnum.WorkoutPlanner,
                        VersionNumberId = (int) VerNoEnum.OneZero,
                        OperatingSystemId = (int) OSEnum.Linux
                    },
                    new ProductVersionOs
                    {
                        ProductId = (int) ProdEnum.WorkoutPlanner,
                        VersionNumberId = (int) VerNoEnum.OneZero,
                        OperatingSystemId = (int) OSEnum.MacOS
                    },
                    new ProductVersionOs
                    {
                        ProductId = (int) ProdEnum.WorkoutPlanner,
                        VersionNumberId = (int) VerNoEnum.OneOne,
                        OperatingSystemId = (int) OSEnum.Linux
                    },
                    new ProductVersionOs
                    {
                        ProductId = (int) ProdEnum.WorkoutPlanner,
                        VersionNumberId = (int) VerNoEnum.OneOne,
                        OperatingSystemId = (int) OSEnum.MacOS
                    },
                    new ProductVersionOs
                    {
                        ProductId = (int) ProdEnum.WorkoutPlanner,
                        VersionNumberId = (int) VerNoEnum.OneOne,
                        OperatingSystemId = (int) OSEnum.Windows
                    },
                    new ProductVersionOs
                    {
                        ProductId = (int) ProdEnum.WorkoutPlanner,
                        VersionNumberId = (int) VerNoEnum.OneOne,
                        OperatingSystemId = (int) OSEnum.Android
                    },
                    new ProductVersionOs
                    {
                        ProductId = (int) ProdEnum.WorkoutPlanner,
                        VersionNumberId = (int) VerNoEnum.OneOne,
                        OperatingSystemId = (int) OSEnum.iOS
                    },
                    new ProductVersionOs
                    {
                        ProductId = (int) ProdEnum.WorkoutPlanner,
                        VersionNumberId = (int) VerNoEnum.OneOne,
                        OperatingSystemId = (int) OSEnum.WindowsMobile
                    },
                    new ProductVersionOs
                    {
                        ProductId = (int) ProdEnum.WorkoutPlanner,
                        VersionNumberId = (int) VerNoEnum.TwoZero,
                        OperatingSystemId = (int) OSEnum.MacOS
                    },
                    new ProductVersionOs
                    {
                        ProductId = (int) ProdEnum.WorkoutPlanner,
                        VersionNumberId = (int) VerNoEnum.TwoZero,
                        OperatingSystemId = (int) OSEnum.Windows
                    },
                    new ProductVersionOs
                    {
                        ProductId = (int) ProdEnum.WorkoutPlanner,
                        VersionNumberId = (int) VerNoEnum.TwoZero,
                        OperatingSystemId = (int) OSEnum.Android
                    },
                    new ProductVersionOs
                    {
                        ProductId = (int) ProdEnum.WorkoutPlanner,
                        VersionNumberId = (int) VerNoEnum.TwoZero,
                        OperatingSystemId = (int) OSEnum.iOS
                    },
                    new ProductVersionOs
                    {
                        ProductId = (int) ProdEnum.SocialAnxietyPlanner,
                        VersionNumberId = (int) VerNoEnum.OneZero,
                        OperatingSystemId = (int) OSEnum.MacOS
                    },
                    new ProductVersionOs
                    {
                        ProductId = (int) ProdEnum.SocialAnxietyPlanner,
                        VersionNumberId = (int) VerNoEnum.OneZero,
                        OperatingSystemId = (int) OSEnum.Windows
                    },
                    new ProductVersionOs
                    {
                        ProductId = (int) ProdEnum.SocialAnxietyPlanner,
                        VersionNumberId = (int) VerNoEnum.OneZero,
                        OperatingSystemId = (int) OSEnum.Android
                    },
                    new ProductVersionOs
                    {
                        ProductId = (int) ProdEnum.SocialAnxietyPlanner,
                        VersionNumberId = (int) VerNoEnum.OneZero,
                        OperatingSystemId = (int) OSEnum.iOS
                    },
                    new ProductVersionOs
                    {
                        ProductId = (int) ProdEnum.SocialAnxietyPlanner,
                        VersionNumberId = (int) VerNoEnum.OneZero,
                        OperatingSystemId = (int) OSEnum.WindowsMobile
                    },
                    new ProductVersionOs
                    {
                        ProductId = (int) ProdEnum.SocialAnxietyPlanner,
                        VersionNumberId = (int) VerNoEnum.OneOne,
                        OperatingSystemId = (int) OSEnum.MacOS
                    },
                    new ProductVersionOs
                    {
                        ProductId = (int) ProdEnum.SocialAnxietyPlanner,
                        VersionNumberId = (int) VerNoEnum.OneOne,
                        OperatingSystemId = (int) OSEnum.Windows
                    },
                    new ProductVersionOs
                    {
                        ProductId = (int) ProdEnum.SocialAnxietyPlanner,
                        VersionNumberId = (int) VerNoEnum.OneOne,
                        OperatingSystemId = (int) OSEnum.Android
                    },
                    new ProductVersionOs
                    {
                        ProductId = (int) ProdEnum.SocialAnxietyPlanner,
                        VersionNumberId = (int) VerNoEnum.OneOne,
                        OperatingSystemId = (int) OSEnum.iOS
                    }
                );

                context.Database.OpenConnection();

                context.Database.ExecuteSqlRaw("SET IDENTITY_INSERT dbo.ProductVersionOs ON");
                
                context.SaveChanges();
                
                context.Database.ExecuteSqlRaw("SET IDENTITY_INSERT dbo.ProductVersionOs OFF");

                context.Database.CloseConnection();
            }
        }

        private static void PopulateStatus(StoneWareContext context)
        {
            if (!context.Status.Any())
            {
                context.Status.AddRange(new Status
                    {
                        Id = 1,
                        Name = "Outstanding"
                    },
                    new Status
                    {
                        Id = 2,
                        Name = "Resolved"
                    });

                context.Database.OpenConnection();

                context.Database.ExecuteSqlRaw("SET IDENTITY_INSERT dbo.Status ON");

                context.SaveChanges();

                context.Database.ExecuteSqlRaw("SET IDENTITY_INSERT dbo.Status OFF");

                context.Database.CloseConnection();
            }
        }

        private static void PopulateProduct(StoneWareContext context)
        {
            if (!context.Product.Any())
            {
                context.Product.AddRange(new Product
                    {
                        Id = (int) ProdEnum.DayTraderWannabe,
                        Name = "Day Trader Wannabe"
                    },
                    new Product
                    {
                        Id = (int) ProdEnum.InvestmentOverlord,
                        Name = "Investment Overlord"
                    },
                    new Product
                    {
                        Id = (int) ProdEnum.WorkoutPlanner,
                        Name = "Workout Planner"
                    },
                    new Product
                    {
                        Id = (int) ProdEnum.SocialAnxietyPlanner,
                        Name = "Social Anxiety Planner"
                    });

                context.Database.OpenConnection();

                context.Database.ExecuteSqlRaw("SET IDENTITY_INSERT dbo.Product ON");

                context.SaveChanges();

                context.Database.ExecuteSqlRaw("SET IDENTITY_INSERT dbo.Product OFF");

                context.Database.CloseConnection();
            }
        }

        private static void PopulateVersionNumber(StoneWareContext context)
        {
            if (!context.VersionNumber.Any())
            {
                context.VersionNumber.AddRange(new VersionNumber
                    {
                        Id = (int) VerNoEnum.OneZero,
                        Description = "1.0"
                    },
                    new VersionNumber
                    {
                        Id = (int) VerNoEnum.OneOne,
                        Description = "1.1"
                    },
                    new VersionNumber
                    {
                        Id = (int) VerNoEnum.OneTwo,
                        Description = "1.2"
                    },
                    new VersionNumber
                    {
                        Id = (int) VerNoEnum.OneThree,
                        Description = "1.3"
                    },
                    new VersionNumber
                    {
                        Id = (int) VerNoEnum.TwoZero,
                        Description = "2.0"
                    },
                    new VersionNumber
                    {
                        Id = (int) VerNoEnum.TwoOne,
                        Description = "2.1"
                    });

                context.Database.OpenConnection();

                context.Database.ExecuteSqlRaw("SET IDENTITY_INSERT dbo.VersionNumber ON");

                context.SaveChanges();

                context.Database.ExecuteSqlRaw("SET IDENTITY_INSERT dbo.VersionNumber OFF");

                context.Database.CloseConnection();
            }
        }

        private static void PopulateOperatingSystem(StoneWareContext context)
        {
            if (!context.OperatingSystem.Any())
            {
                context.OperatingSystem.AddRange(
                    new OperatingSystem
                    {
                        Id = (int) OSEnum.Linux,
                        Name = "Linux"
                    },
                    new OperatingSystem
                    {
                        Id = (int) OSEnum.MacOS,
                        Name = "MacOS"
                    },
                    new OperatingSystem
                    {
                        Id = (int) OSEnum.Windows,
                        Name = "Windows"
                    },
                    new OperatingSystem
                    {
                        Id = (int) OSEnum.Android,
                        Name = "Android"
                    },
                    new OperatingSystem
                    {
                        Id = (int) OSEnum.iOS,
                        Name = "iOS"
                    },
                    new OperatingSystem
                    {
                        Id = (int) OSEnum.WindowsMobile,
                        Name = "Windows Mobile"
                    });

                context.Database.OpenConnection();

                context.Database.ExecuteSqlRaw("SET IDENTITY_INSERT dbo.OperatingSystem ON");

                context.SaveChanges();

                context.Database.ExecuteSqlRaw("SET IDENTITY_INSERT dbo.OperatingSystem OFF");

                context.Database.CloseConnection();
            }
        }

        // ReSharper disable once InconsistentNaming
        [SuppressMessage("ReSharper", "InconsistentNaming")]
        private enum OSEnum
        {
            Linux = 1,
            MacOS = 2,
            Windows = 3,
            Android = 4,
            iOS = 5,
            WindowsMobile = 6
        }

        private enum VerNoEnum
        {
            OneZero = 1,
            OneOne = 2,
            OneTwo = 3,
            OneThree = 4,
            TwoZero = 5,
            TwoOne = 6
        }

        private enum ProdEnum
        {
            DayTraderWannabe = 1,
            InvestmentOverlord = 2,
            WorkoutPlanner = 3,
            SocialAnxietyPlanner = 4
        }

        private static IEnumerable<Issue> GenerateTestIssues()
        {
            // Set the randomiser for repeatable data sets
            Randomizer.Seed = new Random(8675309);

            var issueId = 1;
            var testIssues = new Faker<Issue>()
                .RuleFor(i => i.Id, f => issueId++)
                .RuleFor(i => i.ProductId, f => f.PickRandom(
                    (int) ProdEnum.DayTraderWannabe,
                    (int) ProdEnum.InvestmentOverlord,
                    (int) ProdEnum.WorkoutPlanner,
                    (int) ProdEnum.SocialAnxietyPlanner)
                )
                .RuleFor(i => i.VersionNumberId, (f, i) => PickVersionNumberId(i, f))
                .RuleFor(i => i.OperatingSystemId, (f, i) => PickOperatingSystemId(i, f))
                .RuleFor(i => i.StatusId, f => f.Random.Number(1, 2))
                .RuleFor(i => i.TimeCreated, f => f.Date.Recent(7))
                .RuleFor(i => i.TimeLastUpdated, f => f.Date.Recent(2))
                .RuleFor(i => i.Problem, f => f.Hacker.Phrase())
                .RuleFor(i => i.Resolution,
                    (f, i) => i.StatusId == 2 ? f.Hacker.Phrase() : null);

            var issueList = new List<Issue>();

            for (var i = 0; i < 50; i++)
            {
                var testIssue = testIssues.Generate();
                issueList.Add(testIssue);
            }

            return issueList;
        }

        /// <summary>
        /// Picks a "random", valid OperatingSystemId based on which ProductId and
        /// VersionNumberId have previously been selected.
        /// </summary>
        /// <param name="i">Issue object being populated.</param>
        /// <param name="f">Faker instance populating the Issue object.</param>
        /// <returns></returns>
        private static int PickOperatingSystemId(Issue i, Faker f)
        {
            // Based on which ProductId and VersionNumberId that have been selected, not all versions
            // are necessarily applicable. This expression should select a valid Id.
            return i.ProductId switch
            {
                (int) ProdEnum.DayTraderWannabe => i.VersionNumberId switch
                {
                    (int) VerNoEnum.OneZero =>
                    f.PickRandom((int) OSEnum.Linux, (int) OSEnum.Windows),
                    (int) VerNoEnum.OneOne =>
                    f.PickRandom((int) OSEnum.Linux, (int) OSEnum.MacOS, (int) OSEnum.Windows),
                    (int) VerNoEnum.OneTwo =>
                    f.PickRandom((int) OSEnum.Linux, (int) OSEnum.MacOS, (int) OSEnum.Windows, (int) OSEnum.Android,
                        (int) OSEnum.iOS, (int) OSEnum.WindowsMobile),
                    (int) VerNoEnum.OneThree =>
                    f.PickRandom((int) OSEnum.MacOS, (int) OSEnum.Windows, (int) OSEnum.Android, (int) OSEnum.iOS),
                    _ => 0 // Something went wrong -- 0 should force SQL Server to throw
                },
                (int) ProdEnum.InvestmentOverlord => i.VersionNumberId switch
                {
                    (int) VerNoEnum.OneZero =>
                    f.PickRandom((int) OSEnum.MacOS, (int) OSEnum.iOS),
                    (int) VerNoEnum.TwoZero =>
                    f.PickRandom((int) OSEnum.MacOS, (int) OSEnum.Android, (int) OSEnum.iOS),
                    (int) VerNoEnum.TwoOne =>
                    f.PickRandom((int) OSEnum.MacOS, (int) OSEnum.Windows, (int) OSEnum.Android, (int) OSEnum.iOS),
                    _ => 0 // Something went wrong -- 0 should force SQL Server to throw
                },
                (int) ProdEnum.WorkoutPlanner => i.VersionNumberId switch
                {
                    (int) VerNoEnum.OneZero =>
                    f.PickRandom((int) OSEnum.Linux, (int) OSEnum.MacOS),
                    (int) VerNoEnum.OneOne =>
                    f.PickRandom((int) OSEnum.Linux, (int) OSEnum.MacOS, (int) OSEnum.Windows, (int) OSEnum.Android,
                        (int) OSEnum.iOS, (int) OSEnum.WindowsMobile),
                    (int) VerNoEnum.TwoZero =>
                    f.PickRandom((int) OSEnum.MacOS, (int) OSEnum.Windows, (int) OSEnum.Android, (int) OSEnum.iOS),
                    _ => 0 // Something went wrong -- 0 should force SQL Server to throw
                },
                (int) ProdEnum.SocialAnxietyPlanner => i.VersionNumberId switch
                {
                    (int) VerNoEnum.OneZero =>
                    f.PickRandom((int) OSEnum.MacOS, (int) OSEnum.Windows, (int) OSEnum.Android, (int) OSEnum.iOS,
                        (int) OSEnum.WindowsMobile),
                    (int) VerNoEnum.OneOne =>
                    f.PickRandom((int) OSEnum.MacOS, (int) OSEnum.Windows, (int) OSEnum.Android, (int) OSEnum.iOS),
                    _ => 0 // Something went wrong -- 0 should force SQL Server to throw
                },
                _ => 0 // Something went wrong -- 0 should force SQL Server to throw
            };
        }

        /// <summary>
        /// Picks a "random", valid VersionNumberId based on which ProductId has previously
        /// been selected. 
        /// </summary>
        /// <param name="i">Issue object being populated.</param>
        /// <param name="f">Faker instance populating the Issue object.</param>
        /// <returns></returns>
        private static int PickVersionNumberId(Issue i, Faker f)
        {
            // Based on which ProductId has been selected, not all versions
            // are necessarily applicable. This expression should select a valid Id.
            return i.ProductId switch
            {
                (int) ProdEnum.DayTraderWannabe =>
                f.PickRandom((int) VerNoEnum.OneZero, (int) VerNoEnum.OneOne, (int) VerNoEnum.OneTwo,
                    (int) VerNoEnum.OneThree),
                (int) ProdEnum.InvestmentOverlord =>
                f.PickRandom((int) VerNoEnum.OneZero, (int) VerNoEnum.TwoZero, (int) VerNoEnum.TwoOne),
                (int) ProdEnum.WorkoutPlanner =>
                f.PickRandom((int) VerNoEnum.OneZero, (int) VerNoEnum.OneOne, (int) VerNoEnum.TwoZero),
                (int) ProdEnum.SocialAnxietyPlanner =>
                f.PickRandom((int) VerNoEnum.OneZero, (int) VerNoEnum.OneOne),
                _ => 0 // Something went wrong -- 0 should force SQL Server to throw
            };
        }
    }
}