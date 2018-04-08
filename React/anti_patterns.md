# Anti-patterns

## Props in Initial State

From docs:
> Using props to generate state in getInitialState often leads to duplication of “source of truth”, i.e. where the real data is.
> This is because getInitialState is only invoked when the component is first created.

constructor function is getInitialState. ie, don't use props to set the initial state.


## findDomNode

good example:

```javascript
class MyComponent extends Component {
  componentDidMount() {
    this.something.scrollIntoView();
  }

  render() {
    return (
      <div>
        <div ref={node => this.something = node}/>
      </div>
    )
  }
}
```

## Mixins

Use **Higher Order Components** over Mixins.


## setState in componentWillMount

componentWillMount() is invoked immediately before mounting occurs. It is called before render(), therefore setting state in this method will not trigger a re-render. Avoid introducing any side-effects or subscriptions in this method. Use `componentDidMount` instead.

## mutating state

use this.setState() instead of directly mutating.

## using indexes as keys

better to use the ids of elements instead of the index.

## spreading props dom

When we spread props we run into the risk of adding unknown HTML attributes, which is a bad practice.
