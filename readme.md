# interrobangc/sonar-scanner

This docker image has [sonar-scanner](https://docs.sonarqube.org/display/SCAN/Analyzing+with+SonarQube+Scanner) and nodejs installed.

## Basic usage

Once you have configured your sonar-project.properties configuration file, you can analyze the project with:
```
docker run -it --rm -v $(pwd):/app -w /app interrobangc/sonar-scanner
```
