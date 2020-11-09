#include <iostream>
using namespace std;
void print(int arr[], int n)
{
    for(int i=0; i<n;i++)
    cout<<arr[i]<<" ";
    cout<<endl;
}

void quick(int arr[], int left, int right) 
{
		int l = left, r = right, p = left;
		while (l < r) 
        {
			while (arr[l] >= arr[p] && l < right)
				l++;
			while (arr[r] <= arr[p] && r > left)
				r--;
			if (l >= r) 
            {
				swap(arr[p], arr[r]);
				quick(arr, left, r - 1);
				quick(arr, r + 1, right);
				return;
			}
			swap(arr[l], arr[r]);
		}
}

int main()
{
    int arr[] = {0,1,22,345,-7,0,12,12,-51,-991};
    int n = sizeof(arr)/ sizeof(arr[0]);
    print(arr,n);
    quick(arr,0,n-1);
    print(arr,n);
    return 0;
}