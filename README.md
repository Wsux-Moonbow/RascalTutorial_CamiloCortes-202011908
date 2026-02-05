# Rascal DSL Tutorial: Task Planning Language

A comprehensive tutorial project demonstrating Domain-Specific Language (DSL) development using **Rascal MPL** (Meta-Programming Language). This project implements a custom task planning language with complete syntax definition, semantic checking, and code generation capabilities.

## Features

- **Custom Syntax Definition**: Parse task planning specifications (`.tdsl` files) with persons, tasks, actions, priorities, and durations
- **Type Checking**: Semantic analysis using TypePal for name resolution and type validation
- **Code Generation**: Multiple generator implementations to transform DSL specifications into various output formats
- **IDE Integration**: Full Rascal language workbench support with syntax highlighting and error checking

## DSL Capabilities

The Task Planning DSL supports:
- **Person Management**: Define persons with roles (Manager/Employee) and attributes
- **Task Definition**: Create tasks with actions, assignees, priorities, and optional durations
- **Action Types**: Lunch, Meeting, Report, and Payment actions
- **Duration Support**: Flexible time units (minutes, hours, days, weeks)

## Example

```tdsl
Persons:
Alice { Manager, age 35 }
Bob { Employee, age 28 }

Task Lunch Canteen
person Fred
priority: 8
duration: 1 hour

Task Meeting "Project Demo"
person Alice
priority: 4
duration: 120 min
```

## Project Structure

```
rascaldsl/
├── src/main/rascal/
│   ├── Syntax.rsc      # Grammar and syntax rules
│   ├── Checker.rsc     # Semantic analysis with TypePal
│   ├── Generator1.rsc  # Code generation implementation
│   └── Plugin.rsc      # IDE integration
├── instance/
│   ├── spec1.tdsl      # Example specification
│   └── spec2.tdsl      # Example specification
└── pom.xml             # Maven build configuration
```

## Technologies

- **Rascal MPL** 0.33.3
- **TypePal** 0.8.6 (for semantic analysis)
- **Maven** (build system)
- **Java** 11+

## Getting Started

### Prerequisites

- Java 11 or higher
- Maven
- Rascal IDE (Eclipse-based) or VS Code with Rascal extension

### Building the Project

```bash
mvn clean compile
```

### Running the Generator

Open the Rascal console and execute:

```rascal
import Generator1;
main();
```

This will parse `instance/spec1.tdsl` and generate output to `instance/output/generator1.txt`.

## Learning Resources

This project serves as a hands-on tutorial for:
- Defining concrete syntax with Rascal's grammar notation
- Implementing semantic analysis using TypePal
- Building code generators and transformations
- Integrating custom DSLs into language workbenches

## License

This is an educational tutorial project for learning Rascal MPL and DSL development.
