using OpenQA.Selenium.Chrome;
using TechTalk.SpecFlow;
using OpenQA.Selenium;
using NUnit.Framework;
using System;

namespace WebAutoTest.Features.Steps
{
    [Binding]
    public class WelcomeMessageSteps
    {
        private IWebDriver driver;

        [Given(@"I am on the website ""(.*)""")]
        public void GivenIAmOnTheWebsite(string url)
        {
            driver = new ChromeDriver();
            driver.Navigate().GoToUrl(url);
        }

        [Then(@"I verify the welcome message changes based on time of day")]
        public void ThenIVerifyTheWelcomeMessageChangesBasedOnTimeOfDay()
        {
            IWebElement welcomeMessage = driver.FindElement(By.XPath("//h2[@class='title']"));
            string messageText = welcomeMessage.Text;

            DateTime currentTime = DateTime.Now;  // текущее время суток
            string expectedMessage = GetExpectedMessage(currentTime);

            
            Assert.AreEqual(expectedMessage, messageText); // ожидаемое сообщение/фактическое

            driver.Quit();
        }

        private string GetExpectedMessage(DateTime time)
        {

            if (time.Hour >= 5 && time.Hour < 12)
            {
                return "Доброе утро! 👋🏻";
            }
            else if (time.Hour >= 12 && time.Hour < 18)
            {
                return "Добрый день! 👋🏻";
            }
            else if (time.Hour >= 18 || time.Hour < 5)
            {
                return "Добрый вечер! 👋🏻";
            }
            else
            {
                return "Доброй ночи! 👋🏻";
            }
        }
    }
}
