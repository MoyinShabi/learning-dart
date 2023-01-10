void main(List<String> args) {
  // Functional operators can be combined together to more easily process a collection of values.
  const emails = [
    'abc@abc.com',
    'me@example.co.uk',
    'john@gmail.com',
    'katy@yahoo.com',
    'bob@outlook.com',
  ];
  const knownDomains = ['gmail.com', 'yahoo.com', 'outlook.com'];
  // print(knownDomains.last);

  // Extracting all unknown domains from the list `emails` using functional operators:
  final unknownDomains = getUnknownDomains(emails, knownDomains);
  print(unknownDomains);
  final unknownDOmains2 = getUnknownDomains2(emails, knownDomains);
  print(unknownDOmains2);
}

Iterable<String> getUnknownDomains(List<String> emails, List<String> knownDomains) => emails.map((email) => email.split('@').last).where((domain) => !knownDomains.contains(domain)).toList();
// `getUnknownDomains` uses a "functional style" of programming which saves a lot of work, and can make code easier to write and read because we can understand what each individual step does.

// Each one of the operators return an `Iterable` object.
// Because iterables support functional operators, we can chain them up using the dot `.` access operator.

// Implementing the above function using for loops and if statements:
Iterable<String> getUnknownDomains2(List<String> emails, List<String> knownDomains) {
  var results = <String>[];
  for (var email in emails) {
    final domain = email.split('@').last;
    print(domain);
    if (!knownDomains.contains(domain)) {
      results.add(domain);
    }
  }
  return results;
}
// `getUnknownDomains2` uses an "imperative style" of programming which makes us write a sequence of steps, and use control flow statements in order to produce the desired result.

// NOTE: Between the "Functional" and "Imperative" programming styles, choose the one that makes your code easier to read on a case by case basis.
// The functional style works great when collections need to be manipulated as seen above.

