import heavyai
import pandas as pd
from time import perf_counter


class HeavyAITester:

    def __init__(self, database_name: str, verbose: bool = False) -> None:
        """
        Args:
            database_name: database name to connect
            verbose: enable verbose logging (False by default)
        """
        self.connection = heavyai.connect(
            user="admin",
            password="HyperInteractive",
            host="localhost",
            dbname=database_name,
        )
        self.verbose = verbose

    def close_connection(self) -> None:
        """
        This should explicitly be called to close connection!
        """
        self.connection.close()

    def run_query(self, query_path: str) -> float:
        """
        Args:
            query_path: sql query file path
        Returns:
            runtime of query
        """
        with open(query_path, "r") as queryfile:
            query = queryfile.read()

            try:
                if self.verbose:
                    print(f"Start query {query_path} ... ", end="")
                pstart = perf_counter()
                df = self.connection.select_ipc(query)
                pend = perf_counter()
                if self.verbose:
                    print(f"success! Elapsed time: {pend - pstart}")
            except Exception as e:
                print(e)
                print(f"{query_path} failed")
                return -1

        return pend - pstart

    def run_tpch_qnum(self, qnum: int) -> float:
        """
        Args:
            qnum: tpch query number within [1, 22] inclusive
        Returns:
            runtime of query
        """
        assert qnum > 0, "Invalid TPC-H query number"
        assert qnum < 23, "Invalid TPC-H query number"

        snum = str(qnum)

        if qnum < 10:
            snum = "0" + snum

        qpath = (
            "/home/klee965/src/db_multi_gpu/tpch/queries-rewritten/"
            + "Q"
            + snum
            + ".sql"
        )

        return self.run_query(qpath)

    def run_tpch_all(self) -> dict:
        """
        Args:
            None
        Returns:
            dictionary of query number : runtime
        """
        result = {}

        for qnum in range(1, 23):
            result[qnum] = self.run_tpch_qnum(qnum)

        return result
