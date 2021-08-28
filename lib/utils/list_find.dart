E? listFind<E>(List<E> list, bool Function(E element) test) =>
    list.cast<E?>().firstWhere((v) => test(v!), orElse: () => null);