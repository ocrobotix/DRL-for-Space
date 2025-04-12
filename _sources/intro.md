# Deep Reinforcement Learning for Space

Welcome to our open innovation site, where we invite you to explore our groundbreaking work in Deep Reinforcement Learning (DRL) for the purpose of solving complex war games in space. We understand the importance (necessity) of collaboration within the DRL community, which is why we've chosen to showcase aspects of our work in a Jupyter Book format to bridge communities, making it accessible to both domain experts and software  developers alike. Dive into our research, ask questions, and collaborate with us as we push the boundaries of what's possible in this exciting field. Together, we can shape the future of DRL for the space enterprise.



Comment
--------------




We'll start with an [An Overview of Python](https://zingale.github.io/computational_astrophysics/python/jupyter.html)
and [Version Control with Git](https://zingale.github.io/computational_astrophysics/git/version-control.html) and then
move on to core numerical methods.

You should follow the outline in the navigation panel to the left.

```{note}
This course assumes that you are already familiar with a programming language.
```


Astrophysical Applications
--------------------------

Throughout the course, we'll see some applications to interesting problems in astrophysics.  Here's a listing
to some of them:

::::{grid}
:gutter: 3

:::{grid-item-card} Reaction Rate $T$ Sensitivity
{bdg-info-line}`diff`
An example of using numerical differentiation to
[estimate the 3-$\alpha$ reaction $T$ sensitivity](https://zingale.github.io/computational_astrophysics/basics/diff-int/application-rate-temperature-sensitivity.html).
:::

:::{grid-item-card} Blackbody Radiation
{bdg-info-line}`int`
An example of integrating to infinity by
[integrating the Planck function over wavelength](https://zingale.github.io/computational_astrophysics/basics/diff-int/application-blackbody.html).
:::

:::{grid-item-card} Wien's Law
{bdg-info-line}`roots`
Demonstrating root finding by
[numerically deriving Wien's law](https://zingale.github.io/computational_astrophysics/basics/roots/application-wiens.html).
:::


::::

::::{grid}
:gutter: 3

:::{grid-item-card} Degeneracy
{bdg-info-line}`int` {bdg-info-line}`roots`
Combining integration over the Fermi-Dirac
distribution and root-finding to [find
the electron degeneracy parameters](https://zingale.github.io/computational_astrophysics/basics/roots/application-degeneracy.html).
:::

:::{grid-item-card} Few-Body Problem
{bdg-info-line}`ODEs`
Using adaptive stepping in ODE integration
to [solve the few-body problem](https://zingale.github.io/computational_astrophysics/ODEs/application-few-body.html).
:::

:::{grid-item-card} Polytropes
{bdg-info-line}`roots` {bdg-info-line}`ODEs`
Shooting methods for two-point boundary
value problelms
applied to the [Lane-Emden equation for polytropes](https://zingale.github.io/computational_astrophysics/ODEs/application-lane-emden.html).
:::

::::


::::{grid}
:gutter: 3


:::{grid-item-card} Stability of Planetary Systems
{bdg-info-line}`ODEs`
Investigating the [longterm stability of planetary systems](https://zingale.github.io/computational_astrophysics/ODEs/application-planetary-stability.html)
using symplectic integrators.
:::

:::{grid-item-card} One-Zone X-ray Burst Model
{bdg-info-line}`roots` {bdg-info-line}`ODEs`
ODE integration + root finding
to explore limit-cycles in a 
[one-zone model of an X-ray burst](https://zingale.github.io/computational_astrophysics/ODEs/application-xrb-one-zone.html)
:::

:::{grid-item-card} Integrating the CNO Cycle
{bdg-info-line}`ODEs`
Using stiff-ODE solvers to
[integrate an CNO reaction network](https://zingale.github.io/computational_astrophysics/ODEs/application-CNO-network.html)
:::

::::


::::{grid}
:gutter: 3


:::{grid-item-card} Lorenz System Stationary States
{bdg-info-line}`linalg`
A demonstration of using Newton's method to find
the [stationary states of the Lorenz system](https://zingale.github.io/computational_astrophysics/basics/linear-algebra/application-lorenz.html).
:::

:::{grid-item-card} Interpolating Reaction Rates
{bdg-info-line}`interp`
Using bilinear interpolation to [evaluate tabulated electron-capture rates](https://zingale.github.io/computational_astrophysics/interpolation/application-interpolating-reaction-rates.html).
:::

:::{grid-item-card} Radial Velocity in Frequency Space
{bdg-info-line}`FFTs`
Using FFTs to [find planets from stellar radial velocity curves](https://zingale.github.io/computational_astrophysics/ffts/application-planets-fft.html).
:::


::::

::::{grid}
:gutter: 3

:::{grid-item-card} X-ray timing
{bdg-info-line}`FFTs`
Using FFTs on time-series data to
[study low mass X-ray binaries](https://zingale.github.io/computational_astrophysics/ffts/application-lightcurves.html).
:::

:::{grid-item-card} Hubble's Constant
{bdg-info-line}`fitting`
Using linear regression to [estimate $H_0$ from
Type Ia supernova](https://zingale.github.io/computational_astrophysics/fitting/application-snia-h0.html).
:::

::::

<script src='https://cdn.jotfor.ms/s/umd/latest/for-embedded-agent.js'></script>
<script>
  window.addEventListener("DOMContentLoaded", function() {
    window.AgentInitializer.init({
      agentRenderURL: "https://agent.jotform.com/01962663544672b891ebbd2e010123bfd4dc",
      rootId: "JotformAgent-01962663544672b891ebbd2e010123bfd4dc",
      formID: "01962663544672b891ebbd2e010123bfd4dc",
      queryParams: ["skipWelcome=1", "maximizable=1"],
      domain: "https://www.jotform.com",
      isDraggable: false,
      background: "linear-gradient(180deg, #B3D37B 0%, #B3D37B 100%)",
      buttonBackgroundColor: "#3C4C1E",
      buttonIconColor: "#FFF",
      variant: false,
      customizations: {
        "greeting": "Yes",
        "greetingMessage": "Hi! How can I assist you?",
        "openByDefault": "No",
        "pulse": "Yes",
        "position": "right",
        "autoOpenChatIn": "0"
      },
      isVoice: false,
    });
  });
</script>
