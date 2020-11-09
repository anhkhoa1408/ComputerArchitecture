#include <iostream> 
using namespace std;

void print(int arr[], int n)
{
    for(int i=0; i<n;i++)
    cout<<arr[i]<<" ";
    cout<<endl;
}

void insertionSort(int arr[], int n)
{
    int i, key, j;
    for(i=1;i<n;i++)
    {
        key = arr[i];
        j = i - 1;
        while(j>=0 && arr[j] > key)
        {
            arr[j+1]=arr[j];
            j--;
        }
        arr[j+1]=key;
    }
}  
int binarySearch(int arr[], int l, int r, int x) 
{ 
     if (l <= r) 
    { 
        int m = (l+r)/2; 
    
        if (arr[m] == x)  
            return m;   
    
        if (arr[m] < x)  
            return binarySearch(arr,m+1,r,x);  
    
        else 
            return binarySearch(arr,l,m-1,x);   
    } 
  return -1;  
} 

int findAtIndex(int arr[],int n,int x, int m)
{
    for(int i=0;i<m;i++)
    {
        if(arr[i]==x) cout<<i<<" ";
    }
    for(int i=m;i<n;i++)
    {
        if(arr[i]==x) cout<<i<<" ";
    }
    return -1;
}

int main(void) 
{ 
    int arr[] = {1,1,1,2,2,2,3,3,3,4,4,4}; 
    int x = 4; 
    int n = sizeof(arr) / sizeof(arr[0]);
    print(arr,n);
    insertionSort(arr,n);
    print(arr,n);
    int m = binarySearch(arr, 0 ,n-1 ,x); 
    findAtIndex(arr,n,x, m);
    
    return 0; 
} 