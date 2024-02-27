import numpy as np
import matplotlib.pyplot as plt

def generate_data(n_random_points, noise=16):
    x = np.random.randn(n_random_points) * noise 

    # Add noise
    y += np.random.randn(n_random_points) * noise 
    
    return x, y

# Use the function to generate data
x, y = generate_data(n_random_points=166, noise=3)

# Plot all
plt.scatter(x, y, color='blue', label='Data Points')
plt.show()
