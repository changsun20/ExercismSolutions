defmodule Math do
  @doc """
  Greatest Common Divisor, GCD.
  """
  def gcd(a, b) when b == 0, do: a
  def gcd(a, b), do: gcd(b, rem(a, b))
end

defmodule RationalNumbers do
  @type rational :: {integer, integer}

  @doc """
  Add two rational numbers
  """
  @spec add(a :: rational, b :: rational) :: rational
  def add(a, b) do
    {a1, b1} = a
    {a2, b2} = b
    {a1 * b2 + a2 * b1, b1 * b2}
    |> reduce()
  end

  @doc """
  Subtract two rational numbers
  """
  @spec subtract(a :: rational, b :: rational) :: rational
  def subtract(a, b) do
    {a1, b1} = a
    {a2, b2} = b
    {a1 * b2 - a2 * b1, b1 * b2}
    |> reduce()
  end

  @doc """
  Multiply two rational numbers
  """
  @spec multiply(a :: rational, b :: rational) :: rational
  def multiply(a, b) do
    {a1, b1} = a
    {a2, b2} = b
    {a1 * a2, b1 * b2}
    |> reduce()
  end

  @doc """
  Divide two rational numbers
  """
  @spec divide_by(num :: rational, den :: rational) :: rational
  def divide_by(num, den) do
    {a1, b1} = num
    {a2, b2} = den
    {a1 * b2, a2 * b1}
    |> reduce()
  end

  @doc """
  Absolute value of a rational number
  """
  @spec abs(a :: rational) :: rational
  def abs(a) do
    {a1, b1} = a
    {Kernel.abs(a1), Kernel.abs(b1)}
    |> reduce()
  end

  @doc """
  Exponentiation of a rational number by an integer
  """
  @spec pow_rational(a :: rational, n :: integer) :: rational
  def pow_rational(a, n) do
    {a1, b1} = a
    if n < 0 do
      {b1 ** -n, a1 ** -n}
      |> reduce()
    else
      {a1 ** n, b1 ** n}
      |> reduce()
    end

  end

  @doc """
  Exponentiation of a real number by a rational number
  """
  @spec pow_real(x :: integer, n :: rational) :: float
  def pow_real(x, n) do
    {a1, b1} = n
    x ** (a1 / b1)
  end

  @doc """
  Reduce a rational number to its lowest terms
  """
  @spec reduce(a :: rational) :: rational
  def reduce(a) do
    {a1, b1} = a
    g = Math.gcd(a1, b1)

    if div(a1, g)>0 and div(b1, g)<0 do
      {-div(a1, g), -div(b1, g)}
    else
      {div(a1, g), div(b1, g)}
    end
  end
end
