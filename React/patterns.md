# React Design Patterns

## conditionals in jsx

Can use inline if and && operator. Can be inline if-else with conditional operator. [docs.](https://reactjs.org/docs/conditional-rendering.html)

## async nature of seState

good code snippet for binding my functions:

```javascript
class TestComponent extends React.Component {
  constructor(...args) {
    super(...args);

    [
      '_onTimeoutHandler',
      '_onMouseLeaveHandler',
      '_onClickHandler',
      '_onAjaxCallback',
    ].forEach(propToBind => {
      this[propToBind] = this[propToBind].bind(this);
    });
  }
}
```

Possible solution is that setState actually takes 2 arguments, the second of which is a callback function to execute after the state has been updated. (Ie: a console.log of the state.)


## dependency injection

should come back to re-read this part.

## context wrapper



## event handlers

## flux patterns

## one way data flow

## presentational vs container

## third party integration

## passing function to setState

## decorators

## feature flags using redux

## component switch

## reaching into a component

## list components

## format text via component

## share tracking logic
