import 'dart:io';

void main(List<String> arguments) {
  if (arguments.isEmpty) {
    print("Usage: dart .\\main.dart <inputFile.csv>");
    exit(1); //Error code on failure
  }

  final inputFile = arguments.first;
  final lines = File(inputFile)
      .readAsLinesSync(); //This command creates a handle or a reference to the file using the value that was passed as an argument and then it reads all the contents in one go(the way it is), and returns them as a List of strings and this gets stored in the variable `lines`.
  final totalDurationByTag = <String, double>{};
  lines.removeAt(0);
  // print(lines);

  var totalDuration = 0.0;
  for (var line in lines) {
    final values = line.split(
        ','); //At every iteration of the loop, getting all the values in the line in a list by splitting the line identifying a comma as the separator
    // print(values);

    final durationStr = values[3].replaceAll('"', '');
    // print(durationStr);
    final durationNum = double.parse(
        durationStr); //Understand: Total durations of each activity(tag) is= Values in Map
    // print(durationNum);
    final tag = values[5].replaceAll('"', ''); //Understand: Tags= Keys in Map
    // print(tag);
    // print(totalDurationByTag[tag]);

    //Processing Logic (of the extracted duration and tag, in each iteration of the loop) to understand:
    final previousDuration = totalDurationByTag[
        tag]; //Total duration for this tag up to this point in the loop
    // print(previousDuration);

    //If this is the first duration of this tag
    if (previousDuration == null) {
      totalDurationByTag[tag] =
          durationNum; //Setting the value of this key(or setting it to the duration of the curent iteration)
      // print(durationNum);
      // break;
    } else {
      totalDurationByTag[tag] = previousDuration + durationNum;
      // break;
    }
    totalDuration += durationNum;
  }

  for (var entry in totalDurationByTag.entries) {
    final durationFormatted = entry.value.toStringAsFixed(1);
    final tag = entry.key == '' ? 'Unallocated' : entry.key;
    print('$tag: ${durationFormatted}h');
  }
  print('Total duration of all tags: ${totalDuration.toStringAsFixed(1)}h');
}

/* Pseudo Code:
  lines = File(inputFile) //List of lines that represent the content of CSV file
  durationByTag = empty map //To fill it later by associating the tags of activities(keys) with the total duration for each activity (values)
  lines.removeFirst() //Remove the first line which only contains the header for the entire file
  for (line in lines) //Iterate through all the lines with a for loop
    values = line.split(',') //Get all the values in each line as a list by splitting the line using a comma as the separator 
    duration = values[3] //Read out duration values found at index 3 in each line
    tag = values[5] //Read out tag values found at index 5 in each line
    update(durationByTag[tag], duration) //Update the duration by tag by adding the duration value 
  end
  printAll(durationByTag) //Print the duration for each tag
 */
