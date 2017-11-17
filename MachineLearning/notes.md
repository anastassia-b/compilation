## Notes

### November 9

Naive bayes can be wrong in so far as its assumptions are wrong.
So thats how we can pick better phi values which are doing for the likelihood equation.

So we can square each of the two conditionally dependent words, or make one 1.0…

No absence phis anymore.
Base odds plus all of the absence features.
Now when a word is presence. We’ll put in the presence ratio, and we’ll kill the absence feature. They’ve been folded into phi0.

Phi is odds.
Let’s just assume everything is absent. Then, when we do see a word, we’ll cancel it out.

Phi0 is the original odds that an email is spam.
phi’ is the feature probability ratio. The ratio that a spam email would have the word over the probability that a non-spam email would have the word.

All the words, of which there are m of them.
From the odds we can derive the probability equations.

ODDS RATIO in logistic regression.

Maximizing the likelihood. Now with less stuff.

Maximizing log likelihood. The rule of log is that it turns products into sums.
A lot of the multiplying has become adding.

Gradient descent. Incremental change in the phi value could even fluctuate a lot. Theres no definition of small anymore. Then your step could actually be huge. So thats a problem. Because gradient descent wouldn’t be making the small steps that it needs to. So we want to get rid of the products. So we will reparameterize the equations!!!
We take the log of the phis to get thetas.

Exponentiate and log are the opposites. Adding a lot of thetas together and just exponentiate.
Much better, since its just addition. So its still accurate!

Logistic function. Sigmoid function.
The reparamizerixed likelihood function!!!!
This error function is called the cross entropy error. Minimizing the cross entropy error is equivalent to maximizing the likelihood.
Let’s find the best thetas!!!
Maximizing this is actually minimizing the error of it.
-log probability!!! Is the error function. This is related to entropy!!!

Probability of the dataset_ probablility that the model picks the spammiest email from the dataset.

Why this sigmoid model??? There is a logic to this thing. It’s related to the RIGHT MODEL under a certain assumption. This also suggests why this model could be better than naive bayes. This model is still LINEAR. Just cause I’m free to choose the thetas…

Is this a generalization of naive babes without assumptions? yes.. but…
The naive bayes is a GENERATIVE MODEL. It allows me to answer any kind of probability query.
These thetas are chosen FOR THE SINGLE TASK OF GIVEN THESE WORDS THAT THE EMAIL IS SPAM?
One thing that the naive bayes model is..
THIS IS A DISCRIMINATIVE CLASSIFIER (conditional classifier, with thetas deciding on spam email) while naive bayes is a GENERATIVE MODEL.

The discriminative one where if they go to a website in incognito mode.. we’re assuming that they didn’t.
For medical diagnosis… other tests that you didn’t run are not equivalent to running tests and getting negative.
GENERATIVE MODELS are in the medical domain, while discriminative models are used in a lot of other domains.

### November 14

 Neural networks are networks of logistic regression models feeding into each other.
Boolean variables take binary variables and output binary variables. (Like And and Or).
Any Boolean functions can be written in terms of just a few.
Not, and, or, nand.

64 bits in, 32 bits out -> And and floating point division.

So, emails can be written as a vector (boolean circuits), and then outputs 1 or 0.

A logistic regression model could learn how to be a boolean circuit.
The model has a linear decision boundary.

Pair features that words are spam. One word might not mean anything, but both of them together, do.
Add new features which are the combo, then run the logistic regression with the new additional features.
Thats O(N^2) more features. Most will be totally useless.
Every feature that we add adds capacity to the model, but that’s bad since it’ll be too specific.
So with limited data, it’s bad. The weights will be too specific, it’ll memorize.

The goodness of a network/circut is how often it misclassifies (error).
But making one change at a time is inefficient for 2 reasons. Using gradient descent would be good.
1. All of our choices are discreet. (But in a logistic regression model, we can change the theta a little bit). The wiring choices are discreet too.
2. Derivatives of zero.

How to change? Logical gates can be approximates by logistic regression models!
Thetas are implicitly explaining how to wire things.

We want to do 2 things with a neural network:
1. inference. Forward propagation.
2. How to set the the theta values. Back propagation.

Z values are pre-activations.

Multiply by matrix, run the activation function, multiply by matrix, run the activation functions.
Tensor flow: you give it the architecture, and you give it the data and it find them.
It’s pretty low level. You have to tell it that you give it the matrix of M by N versions.

There’s an easier, higher concept version called Keras.

### November 15

Machine learning individual has intuition for the type of model.
Each layer goes down in powers of 2 or 10.
Image problems use convolution, dense connections.
Activation function, the sigmoid function is not the most popular anymore.

Butterfly effect. But rectified linear unit function… is more proportional error.
The amount of signal you’re getting per layer is going down 1/4th each time, if you’re in the most max change part.

Don’t want to use sigmoid functions for deep networks.
Sigmoid was the standard for decades because there was only 1 hidden layer.
Sigmoid is more similar to digital logic gate.

Sigmoid gives a value of zero to 1.
Alternative Hyperbolic Function (from -1 to 1) when we get to long short term memory.

Any Boolean function can be represented by a single layer of many inputs. Because it’s like a lot of Ands and an OR

50-100 convolutional neural layers for distinguishing tons of types of things.
Just between cats and dogs could be 1 hidden layer with like 512 input variables.
If you have 0 hidden layers its just a logistic regression. Cause just input and output.

Convolutional layers are not as expensive as densely connected a layer.
On our machines.. 4-5 layers with cpu.

For BACK PROPAGATION.
Partial derivatives. We need to know the error with respect to theta.
Gradient descent.

We can’t change z3 directly, but we can change the b’s and the thetas (or a’s?).


### November 16

Convolutional Neural networks for images.
x_tensor: (60,000, 28, 28). Images are 28 by 28pixels.
y_tensor: (60,000)

An image is 0-255 values as intensities. We want to flatten the image to be one long value.
Our layers are 1 dimensional, so we'll use a Flatten layer.

The z values are the same: the weighted sums of the value of each node. linear sum.
If there are 2 output classes, we had binary cross entropy.

logistic regression because there are no hidden layers. categorical cross entropy.
optimizer is stochastic gradient descent. one hot / to_categorical.

We're testing categorizing images as digits. Linear regression alone works with a pretty surprisingly good accuracy. Kernel_initializer = "zeros" would set all the thetas to zero. Our concern would be if all the derivatives would be zero.

 Learning the spatial representation of the pixels to guess a "5". It's recovering some information about the shapes of numbers.

We want the network to learn the concept of horizontal lines regardless of its location.
But it's hard to learn that if the network doesn't understand that various horizontal lines.. like 100 sunrises, and you ask on the next day what will happen, I don't know it's a totally different day.
But want it to make that connection. To extract a general commonality that is useful.

Filter dimension: receptive field of a filter.
We intuit: Number of filters and filter dimensions!

Learning horizontal and vertical lines.
At the end of the day, a dense layer can do what a convolutional layer does...
Sparse connectivity: the output values of the output image are only connected to a small number of values in the input image. It's much more efficient!

Anything we can do to prep the image (crop, resize, rotate).
Last note: new network recently which is the capsule network.
Currently we are looking for patterns in a 2 dimensional image. But if our image is far away, or rotated.
We haven't taken advantage of the fact that 2d images are from 3d worlds. But currently we live in flatland. There's a problem with pose.

Change 0-255 into canonical range of 0 to 1. This really improved the classifications. The error derivatives.

Next up will be: Recurrent neural network that read continuous data. Like text or sound.
