# Tractian (Mobile App Challenge)

## Description
This application provides a dynamic Tree View representation of companies' assets, sub-assets, components, and locations. It visualizes hierarchical relationships and supports advanced filtering and navigation features, helping users explore assets efficiently.
[See full instructions](https://github.com/tractian/challenges/blob/main/mobile/README.md)

## Video Demo
https://github.com/user-attachments/assets/00937241-77bf-47c3-b434-54311cc8fa3e

## Improvements with More Time

### Integration Tests
- Add comprehensive integration tests to validate cross-layer communication and user flows.

### Enhanced UI
- Match Figma's design 1-to-1.
- Add smooth animations for tree node expansion and filtering.

### Cross-Platform Optimization
- Test and enhance performance on web and desktop clients.

## Technical Notes

### Environment Variables
- The env.json file is included in the repository for ease of testing.
- In production, sensitive data would be passed securely through CI/CD pipelines or deployment environments.

### Architectural Simplification
- The app uses a single repository layer for data handling.
- In a full-scale application, local and remote data sources would be separated, and the repository would consolidate data for the presentation layer.
- The project also uses the flat feature layer approach
  
### Scalability
- All tree nodes are initially expanded during testing to validate UI performance with large datasets.
- Subtrees with more than 3 children remain collapsed (by default) for better usability.

## Setup and Running the Project

### Prerequisites
- Flutter SDK installed (instructions)
- A code editor such as VS Code or Android Studio.

### Steps
#### Clone the repository:
```
git clone git@github.com:developerjamiu/Tractian.git
cd tractian
```

#### Install dependencies:
```
flutter pub get
```

#### Set up environment variables:
- Modify the env.json file to include necessary configurations (tractianApiHost).
- The provided launch configuration assumes env.json is located in the project root.

#### Launch the app using VS Code:
- Run the project by selecting Launch Development in the debug configuration.

#### Alternatively, use the command line:

```
flutter run --dart-define-from-file=env.json
```
