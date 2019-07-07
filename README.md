# SparseVote Circle Detection
 The detector represents each circle instance by a set of equally distributed arcs and searches for the same number of edge points to cover these arcs. 

## Dependency:
OpenCV 2.4.10

## Demo:

Running demo.m will give the test results and visualize them.

## Usage of the circle detector:
sparsevote(imgDir,K,Nr,rLo,rHi):

  * imgDir ： Directory of the input image
  * K      : the count for discretized segments  
  * Nr     : the count for discretized radii, usually makes the step of radius around 2-3  
  * rLo    : the min radius of the circle to be searched  
  * rHi    : the max radius of the circle to be searched


##Sample results:
![image](https://github.com/cartoonxjtu/CircleDetectionDatasets/blob/master/sampleimages/sampleimages.png)
