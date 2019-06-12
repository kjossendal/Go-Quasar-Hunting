function Country(data) {
  Object.assign(this, Country.template, data);
}

Object.defineProperty(Country, "template", {
  get() {
    return {
      name: {},
      currency: [],
      languages: {},
      capital: ""
    };
  }
});

export default Country;
