#include <iostream>
#include <vector>
using namespace std;

bool triangleFriendship(std::vector<int> arr)
{
    for(int i=0;i<arr.size();i++)
    {
        int j = arr[i];
        for(int k=j+1;k<arr.size();k++)
        {
            if(j==arr[k])
            {
                return false;
                break;
            }
            else
            {
                int l = arr[k];

            }
            
        }
    }
}


int main()
{
    vector<int> a ={2,4,5,1,3};
    cout<<triangleFriendship(a);
}