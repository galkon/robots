# Toy Robot Simulator

This application is a simulation of a toy robot moving on a square tabletop, of dimensions 5 units x 5 units.

## Running the simulator

### Bundle the application
```
bundle install
```
### Running the application with the provided test files:
```
ruby robots.rb robot_files/robots1.txt
```
```
ruby robots.rb robot_files/robots2.txt
```
```
ruby robots.rb robot_files/robots3.txt
```
```
ruby robots.rb robot_files/all_actions_robots.txt
```
```
ruby robots.rb robot_files/patchy_robots_file.txt
```
## Testing

This application has been tested using Rspec, you can run all the tests with the following command:

```
bundle exec rspec spec
```