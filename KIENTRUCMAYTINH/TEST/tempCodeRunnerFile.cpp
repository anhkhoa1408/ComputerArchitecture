bool isPrime(int n) 
{ 
    // Corner case 
    if (n <= 1) 
        return false; 
  
    // Check from 2 to n-1 
    for (int i = 2; i < n; i++) 
        if (n % i == 0) 
            return false; 
  
    return true; 
} 
int quarantinedPrimes(int l, int r)
{
    static int count=0;
    static int k,e,m,n;
    for(int i=l;i<=r;i++)
    {
        if(isPrime(i))
        {
            k=i;
        }
        else
        {
            continue;
        }
        for(int i=k+1;i<=r;i++)
        {
            if(isPrime(i))
            {
                e=i;
                break;
            }
        }
        for(int i=e+1;i<=r;i++)
        {
            if(isPrime(i))
            {
                m=i;
                break;
            }
        }
        if(abs(e-k)>=10 && abs(m-e)>=10)
        {
            count++;
        }
    }
    return count;
}