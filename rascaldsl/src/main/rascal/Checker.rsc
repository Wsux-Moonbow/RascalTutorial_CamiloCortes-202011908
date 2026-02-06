module Checker

import Syntax;
 
extend analysis::typepal::TypePal;
import ParseTree;
import String;

data IdRole = personId();

data AType = personType();

data DefInfo(list[Person] person = []);

data Person = person(str role = "Employee", int age = 0);

// Helper function to eliminate code duplication
private TModel collectAndSolve(Tree pt, TypePalConfig config) {
    c = newCollector("collectAndSolve", pt, config);
    collect(pt, c);
    return newSolver(pt, c.run()).run();
}

public TModel modulesTModelFromTree(Tree pt) {
    if (pt has top) pt = pt.top;
    return collectAndSolve(pt, getModulesConfig());
}

private TypePalConfig getModulesConfig() = tconfig(
      verbose=true,
      logTModel = true,
      logAttempts = true,
      logSolverIterations= true,
      logSolverSteps = true,
      isSubType = subtype
);

void collect(current: (Person) `<ID name> { <Role role> , age <INT age> }`,  Collector c) {
     dt = defType(personType());
     dt.person = [person(role="<role>", age=toInt("<age>"))];
     c.define("<name>", personId(), name, dt);
}

void collect(current: (Task) `Task <Action action>
                        'person <ID name> 
                        'priority: <INT prio>
                        '<Duration? duration>`,  Collector c) {
     c.use(name, {personId()});
}

