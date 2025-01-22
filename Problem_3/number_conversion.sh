#!/bin/bash

# Function to convert decimal to binary
decimal_to_binary() {
    local num=$1
    local binary=""

    # Loop until the number becomes 0
    while ((num > 0)); do
        binary=$((num % 2))"$binary"  # Get the remainder and prepend to the binary string
        num=$((num / 2))             # Divide the number by 2
    done

    # Return the binary value (or 0 if empty)
    echo "${binary:-0}"
}

# Function to convert decimal to hexadecimal
decimal_to_hexadecimal() {
    local num=$1
    local hex=""

    # Loop until the number becomes 0
    while ((num > 0)); do
        remainder=$((num % 16))  # Find the remainder
        num=$((num / 16))        # Divide the number by 16

        # Map the remainder to hexadecimal (0-9, A-F)
        if ((remainder < 10)); then
            hex="${remainder}${hex}"  # Append numbers (0-9)
        else
            # Convert remainders 10-15 to 'A'-'F'
            hex="$(printf "\\x$(printf '%x' $((remainder + 55)))")${hex}"
        fi
    done

    # Return the hexadecimal value (or 0 if empty)
    echo "${hex:-0}"
}

# Main script usage
echo "Enter a decimal number (less than 100,000):"
read decimal

# Validate the input
if ! [[ "$decimal" =~ ^[0-9]+$ ]]; then
    echo "Error: Input must be a non-negative integer."
    exit 1
fi

if ((decimal >= 100000)); then
    echo "Error: Number must be less than 100,000."
    exit 1
fi

# Convert to binary and hexadecimal
binary_result=$(decimal_to_binary "$decimal")
hexadecimal_result=$(decimal_to_hexadecimal "$decimal")

# Display the results
echo "Decimal: $decimal"
echo "Binary: $binary_result"
echo "Hexadecimal: $hexadecimal_result"