// Bubble Sort, visualised
// Sean M Elliott, September 2019

float[] values;

int i = 0;
int j = 0;

void setup() {
  int newPos;

  size(400, 300); // Screen size

  values = new float[width/10]; 
  // The rectangles are 10 wide, 
  // so divide screen width by 10 
  // for total number of values.

  // Start by making values range with same difference between each.
  for (int i=0; i < values.length; i++) {
    values[i] = (height/(float(values.length)))*(i+1); // Cast length from int to float.
  }

  // Now randomly order the values.
  for (int i = 0; i < values.length; i++) {
    newPos = int(random(values.length));
    swap(values, i, newPos);
  }
}


void swap(float[] arr, int a, int b) {
  float temp = arr[a];
  arr[a] = arr[b];
  arr[b] = temp;
}

void sortStep() {
  float a = values[j];
  float b = values[j+1];

  delay(40);  // Play with this value to get good timing.

  if (a > b) {
    swap(values, j, j+1);
  }

  if (i < values.length) {
    j = j + 1;
    if (j >= values.length-i-1) {
      j = 0;
      i = i + 1;
    }
  } else {
    println("Finished Sorting");
    noLoop();
  }
}

void draw() {
  background(255); // Background colour.

  // One step of the sorting algorithm.
  sortStep(); 

  // Choose colour and draw rectangle.
  // If the value is being moved, make it red.
  // Otherwise, gray.
  stroke(255); // White outline
  for (int i = 0; i < values.length; i++) {
    if (i == j) {
      fill(255, 0, 0); // Red rectangle
    } else {
      fill(100); // Gray rectangle
    }
    if (i == 0) {
      fill(100); // Gray rectangle
    }
    rect((i*10), height-values[i], 10, values[i]);
  }
}
