function m = generateRandomMatrix(n, min, max)
  m=rand(n);
  m*=(max-min);
  m+=min;
  m-=mod(m,1);
end
