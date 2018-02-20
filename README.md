[![Build Status](https://travis-ci.org/oskarek/morra.svg?branch=master)](https://travis-ci.org/oskarek/morra)

# Morra

The odds and evens variant of the [Morra game](https://en.wikipedia.org/wiki/Morra_(game)), written in Haskell. The purpose of this project is to learn how to use monad transformers, in this case the StateT monad transformer is used.

## Getting Started

### Prerequisites

Install [stack](https://www.haskellstack.org/):
```
curl -sSL https://get.haskellstack.org/ | sh
```

### Building and running the game

At the prject root, first run:

```
stack build
```

and then

```
stack exec morra-exe
```

## Running the tests

At the project root, run:
```
stack test
```

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE) file for details
