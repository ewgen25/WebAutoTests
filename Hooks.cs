using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Allure.Commons;
using TechTalk.SpecFlow;

namespace WebAutoTest
{
    [Binding]
    public class Hooks
    {
        public static AllureLifecycle allure = AllureLifecycle.Instance;

        [BeforeTestRun]
        public static void BeforeTestRun()
        {
            allure.CleanupResultDirectory();
        }
    }
}
