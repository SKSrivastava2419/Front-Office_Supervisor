package Runner;

import io.cucumber.testng.CucumberOptions;

@CucumberOptions(features = "src/test/resources/features",
        glue = {""},
        plugin = {"pretty"},
        monochrome = true,
        publish = true)

public class FOrunner {
}
