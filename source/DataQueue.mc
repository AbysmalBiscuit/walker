import Toybox.Lang;


// An efficient circular queue implementation that will store the most recently added X entries
class DataQueue {

	var data as Array<AnyNumber or Null>;
	var trackAvg as Boolean = false;
	var maxSize as Integer = 0;
	var pos as Integer = 0;
	var total as AnyNumber = 0.0;
	var size as Integer = 0;
	var average as Numeric = 0.0;

	function initialize(arraySize as Integer, trackAverage as Boolean) {
		data = new[arraySize] as Array<AnyNumber or Null>;
		maxSize = arraySize;
		trackAvg = trackAverage;
	}

	// Add a new element to the array
	function add(element as Numeric or Integer) as Void {
		if (trackAvg) {
			var oldestVal = data[pos];
			if (oldestVal != null) { total -= oldestVal; }
			total += element;
			if (size < maxSize) { size++; }
			average = total > 0 ? total.toFloat() / size : 0.0;
		}
		data[pos] = element;
		pos = (pos + 1) % maxSize;
	}

	// Reset all the entries in the array to null
	function reset() as Void {
		data = new[maxSize] as Array<AnyNumber or Null>;
		pos = 0;
		total = 0.0;
		size = 0;
		average = 0.0;
	}

	// Get the least recently added entry in the array
	function oldest() as AnyNumber? { return data[pos] != null ? data[pos] : data[0]; }

	// Get the most recently added entry in the array
	function newest() as AnyNumber? { return data[pos == 0 ? maxSize - 1 : (pos - 1) % maxSize]; }

}
