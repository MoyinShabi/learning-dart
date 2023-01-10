void main() {
  /*
    1st iteration:
    -final previousDuration = totalDurationByTag['Blogging']; //null
    -totalDurationByTag['Blogging'] = durationNum; //1.5
    2nd iteration:
    -final previousDuration = totalDurationByTag['Blogging']; //1.5
    -totalDurationByTag['Blogging'] = previousDuration + durationNum; //2.0
    3rd iteration:
    -final previousDuration = totalDurationByTag['Blogging']; //2.0
    -totalDurationByTag['Blogging'] = previousDuration + durationNum; //2.5
    4th iteration:
    -final previousDuration = totalDurationByTag['Blogging']; //2.5
    -totalDurationByTag['Blogging'] = previousDuration + durationNum; //5.17
    5th iteration:
    -final previousDuration = totalDurationByTag['FFC']; //null
    -totalDurationByTag['FFC'] = durationNum; //2.83
    6th iteration:
    -final previousDuration = totalDurationByTag['FFC']; //2.83
    -totalDurationByTag['FFC'] = previousDuration + durationNum; //6.08
    7th iteration:
    -final previousDuration = totalDurationByTag['']; //null
    -totalDurationByTag[''] = previousDuration + durationNum; //1
    8th iteration:
    -final previousDuration = totalDurationByTag['FFC']; //6.08
    -totalDurationByTag['FFC'] = previousDuration + durationNum; //8
    9th iteration:
    -final previousDuration = totalDurationByTag['FFC']; //8
    -totalDurationByTag['FFC'] = previousDuration + durationNum; //9.92
    10th iteration:
    -final previousDuration = totalDurationByTag['FFC']; //9.92
    -totalDurationByTag['FFC'] = previousDuration + durationNum; //10.67
    
    ...
    18th iteration:
    -final previousDuration = totalDurationByTag['YTP']; //null
    -totalDurationByTag['YTP'] = durationNum; //2.5
    ...
    20th iteration:
    -final previousDuration = totalDurationByTag['']; //1
    -totalDurationByTag[''] = previousDuration + durationNum; //2.25
    ...
    23rd iteration:
    -final previousDuration = totalDurationByTag['YTP']; //2.5
    -totalDurationByTag['YTP'] = previousDuration + durationNum; //3

    ...
    27th iteration:
    -final previousDuration = totalDurationByTag['CE']; //null
    -totalDurationByTag['CE'] = durationNum; //1

    ...
    59th iteration:
    -final previousDuration = totalDurationByTag['CE']; //1
    -totalDurationByTag['CE'] = previousDuration + durationNum; //1.5
    
    ...

   */
}
