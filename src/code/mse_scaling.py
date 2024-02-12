from mse_vanilla import mean_squared_error as vanilla_mse
from mse_numpy import mean_squared_error as numpy_mse
import sklearn.metrics as sk
import timeit as it

observed = [2, 4, 6, 8]
predicted = [2.5, 3.5, 5.5, 7.5]

mse_vanilla = vanilla_mse(observed, predicted)
exec_time = it.timeit('vanilla_mse(observed, predicted)', 
                      globals=globals(), number=10) / 100
print("Mean Squared Error, vanilla :", mse_vanilla, 
      f"Average execution time: {exec_time} seconds")

mse_numpy = numpy_mse(observed, predicted)
exec_time = it.timeit('numpy_mse(observed, predicted)',
                      globals=globals(), number=10) / 100
print("Mean Squared Error, numpy :  ", mse_numpy, 
      f"Average execution time: {exec_time} seconds")

sk_mse = sk.mean_squared_error(observed, predicted)
ex_time = it.timeit('sk.mean_squared_error(observed, predicted)',
                    globals=globals(), number=10) / 100
print("Mean Squared Error, sklearn :", sk_mse, 
      f"Average execution time: {ex_time} seconds")

assert(mse_vanilla == mse_numpy == sk_mse)
